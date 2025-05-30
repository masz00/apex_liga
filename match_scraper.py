from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time
import json
import re


class Browser:
    browser, service = None, None

    def __init__(self, driver: str):
        self.service = Service(driver)
        self.browser = webdriver.Chrome(service=self.service)

    def get_links_in_group(self, group_class: str):
        try:
            group_section = WebDriverWait(self.browser, 10).until(
                EC.presence_of_element_located((By.CLASS_NAME, group_class))
            )
            links = group_section.find_elements(By.TAG_NAME, "a")
            
            for link in links:
                href = link.get_attribute("href")
                if href:
                    print(f"Visiting: {href}")
                    self.browser.get(href)
                    time.sleep(2)
                    self.browser.back()
                    time.sleep(2)
        except Exception as e:
            print(f"Error: {e}")


    def get_team_links(self, url):
        self.browser.get(url)
        accept_button = WebDriverWait(self.browser, 10).until(
            EC.element_to_be_clickable((By.CLASS_NAME, "fc-button.fc-cta-consent.fc-primary-button"))
        )
        accept_button.click()
        
        try:
            table_section = WebDriverWait(self.browser, 10).until(
                EC.presence_of_element_located((By.CSS_SELECTOR, 'ul.list-group.grouptable'))
            )
            
            list_links = table_section.find_elements(By.TAG_NAME, "a")
            team_links = []
            for link in list_links:
                href = link.get_attribute('href')
                if href and href.startswith('https://regiowyniki.pl/druzyna/'): 
                    team_links.append(href)
            
            team_links = list(set(team_links))
            return team_links

        except Exception as e:
            print(f"Error: {e}")
            return []
        
    def get_match_links(self, url):
        self.browser.get(url)
        try:
            table_section = WebDriverWait(self.browser, 10).until(
                EC.presence_of_element_located((By.XPATH, '//div[contains(@class, "matcheslist")]'))
            )
            list_links = table_section.find_elements(By.XPATH, './/li[contains(@class, "list-group-item")]//a[starts-with(@href, "/mecz/")]')
            match_links = []
            for link in list_links:
                href = link.get_attribute('href')
                if href and "Puchar" not in href: 
                    match_links.append(href)
            return list(set(match_links))

        except Exception as e:
            print(f"Error: {str(e)}")

    def get_match_data(self, url):
        time.sleep(5)
        self.browser.get(url)
        match_id = re.search(r'mecz/(\d+)/', url).group(1)
        match_no_info = ['135670', '125964'] #wyjątki //napisać bardziej generalnie 
        if match_id in match_no_info:
            return None

        c_ref = None
        as_ref1 = None
        as_ref2 = None
        match_week = None
        match_date = None
        match_time = None
        home_team_score = None
        away_team_score = None
        home_team_name = None
        away_team_name = None
        home_base_players = []
        home_reserve_players = []
        away_base_players = []
        away_reserve_players = []
        events = []

        try:
            referees = self.browser.find_element(By.ID, "referees").text
            c_ref = referees.split(' (')[0]
            as_ref1 = referees.split(' (')[1].split(', ')[1]
            as_ref2 = referees.split(' (')[2].split(', ')[1]
        except Exception as e:
            print(f"Error while extracting referees: {e}")

        try:
            match_week = self.browser.find_element(By.XPATH, "//ul[@class='breadcrumbs']/li[last()]").text
        except Exception as e:
            print(f"Error while extracting match week: {e}")

        try:
            date_time_element = self.browser.find_element(By.XPATH, "//ul[@class='breadcrumbs']/span[@class='hidden-xs text-muted']/time")
            match_date = date_time_element.get_attribute("datetime").split("T")[0]  # Data w formacie YYYY-MM-DD
            match_time = date_time_element.get_attribute("datetime").split("T")[1].split("+")[0]  # Czas w formacie HH:MM:SS
        except Exception as e:
            print(f"Error while extracting match date and time: {e}")
        
        try:
            home_team_score = self.browser.find_element(By.XPATH, '//div[@class="row goals"]//div[@class="goal result1"]').text
            away_team_score = self.browser.find_element(By.XPATH, '//div[@class="row goals"]//div[@class="goal result2"]').text
        except Exception as e:
            print(f"Error while extracting scores: {e}")

        try:
            lineups_button = self.browser.find_element(By.XPATH, '//li[@id="matchteamstab"]/a')
            lineups_button.click()
            WebDriverWait(self.browser, 10).until(
                EC.presence_of_element_located((By.XPATH, '//div[@class="col-sm-6 col-xs-12"]//ul[@id="team1plrs"]'))
            )
            teams_name = self.browser.find_elements(By.XPATH, '//div[@class="col-sm-6 col-xs-12"]/h3')

            home_team_name = teams_name[0].text
            away_team_name = teams_name[1].text
        except Exception as e:
            print(f"Error while extracting team names: {e}")

        try:
            home_players_elements = WebDriverWait(self.browser, 10).until(
                EC.presence_of_all_elements_located((By.CSS_SELECTOR, "#team1plrs .list-group-item .name"))
            )
            home_players = [player.text for player in home_players_elements]
            home_base_players = home_players[:11]
            home_reserve_players = home_players[11:]
        except Exception as e:
            print(f"Error while extracting home players: {e}")

        try:
            away_players_elements = WebDriverWait(self.browser, 10).until(
                EC.presence_of_all_elements_located((By.CSS_SELECTOR, "#team2plrs .list-group-item .name"))
            )
            away_players = [player.text for player in away_players_elements]
            away_base_players = away_players[:11]
            away_reserve_players = away_players[11:]
        except Exception as e:
            print(f"Error while extracting away players: {e}")
        
        try:
            event_rows = self.browser.find_elements(By.CSS_SELECTOR, "table.hidden-xs tbody tr")
            for row in event_rows:
                left_event = row.find_element(By.CSS_SELECTOR, "td.left .details").text if row.find_elements(By.CSS_SELECTOR, "td.left .details") else None
                right_event = row.find_element(By.CSS_SELECTOR, "td.right .details").text if row.find_elements(By.CSS_SELECTOR, "td.right .details") else None
                text_event = left_event if left_event else right_event
                side = "home" if left_event else "away"

                left_minute = row.find_element(By.CSS_SELECTOR, "td.left .timer .col-xs-6, td.right .timer .col-xs-6").text[1:] if row.find_elements(By.CSS_SELECTOR, "td.left .timer .col-xs-6, td.right .timer .col-xs-6") else None
                right_minute = row.find_element(By.CSS_SELECTOR, "td.right .timer .col-xs-6:last-child").text[1:] if row.find_elements(By.CSS_SELECTOR, "td.right .timer .col-xs-6:last-child") else None
                minute = left_minute if left_minute else right_minute

                event_type = None
                if row.find_elements(By.CSS_SELECTOR, "td.left .imagemap.change, td.right .imagemap.change"):
                    text_event = f'{text_event.split(" (")[0]}.{text_event.split(" (" )[1][:-1]}'
                    event_type = "change"

                elif row.find_elements(By.CSS_SELECTOR, "td.left .imagemap.yellow, td.right .imagemap.yellow"):
                    event_type = "yellow_card"
                elif row.find_elements(By.CSS_SELECTOR, "td.left .imagemap.red, td.right .imagemap.red"):
                    event_type = "red_card"
                elif row.find_elements(By.CSS_SELECTOR, "td.left .imagemap.goal, td.right .imagemap.goal") and "(rzut karny)" in text_event:
                    text_event = text_event.split('\n')[0] if left_event else text_event.split('\n')[1]
                    event_type = "pen_goal"
                elif row.find_elements(By.CSS_SELECTOR, "td.left .imagemap.suicide, td.right .imagemap.suicide"):
                    text_event = text_event.split('\n')[0] if left_event else text_event.split('\n')[1]
                    event_type = "own_goal"
                elif row.find_elements(By.CSS_SELECTOR, "td.left .imagemap.goal, td.right .imagemap.goal"):
                    event_type = "goal"

                if text_event:
                    events.append({
                        "team": side,
                        "minute": minute,
                        "event": text_event,
                        "event_type": event_type
                    })
        except Exception as e:
            print(f"Error while extracting events: {e}")

        match_data = {
            "match_id": match_id,
            "referees": {
                "center": c_ref,
                "assistant_1": as_ref1,
                "assistant_2": as_ref2
            },
            "match_details": {
                "week": match_week,
                "date": match_date,
                "time": match_time,
                "scores": {
                    "home": home_team_score,
                    "away": away_team_score
                },
                "teams": {
                    "home": home_team_name,
                    "away": away_team_name
                }
            },
            "players": {
                "home": {
                    "base": home_base_players,
                    "reserve": home_reserve_players
                },
                "away": {
                    "base": away_base_players,
                    "reserve": away_reserve_players
                }
            },
            "events": events
        }
        
        return match_data

def save_match_data(matches_data, filename="match_data.json"):
    try:
        with open(filename, 'r', encoding='utf-8') as f:
            existing_data = json.load(f)
    except FileNotFoundError:
        existing_data = []

    existing_data.extend(matches_data)

    with open(filename, 'w', encoding='utf-8') as f:
        json.dump(existing_data, f, indent=4, ensure_ascii=False)


def collect_and_save_matches():
    matches_id = [] 
    matches_data = [] 
    browser = Browser(r'C:\Users\Marek\Desktop\prog\chromiumdriverrr\chromedriver-win64\chromedriver.exe')
    team_links = browser.get_team_links('https://regiowyniki.pl/wyniki/Pilka_Nozna/2024/2025/20241203/mecze/Kujawsko-Pomorskie/4_Liga/')
    
    for i, team_link in enumerate(team_links):
        match_links = browser.get_match_links(team_link)
        for j, match_link in enumerate(match_links):
            match_id = re.search(r'mecz/(\d+)/', match_link).group(1)
            if match_id in matches_id:
                continue
            print(i+1, j+1, match_link)
            match_data = browser.get_match_data(match_link)
            if match_data:
                matches_id.append(match_id)
                matches_data.append(match_data)
            
            
            
        print(len(matches_id))
    save_match_data(matches_data)
    print(matches_id)




browser = Browser(r'C:\Users\Marek\Desktop\prog\chromiumdriverrr\chromedriver-win64\chromedriver.exe')
match_data = browser.get_match_data('https://regiowyniki.pl/mecz/129597/Pilka_Nozna/Kujawsko-Pomorskie/4_Liga/')
save_match_data(match_data, "jeden.json")
