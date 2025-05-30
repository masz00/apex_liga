import json
import random
from datetime import datetime, timedelta
with open('match_data.json', 'r', encoding='utf-8') as file:
    data = json.load(file)

referee_id = 1
team_id = 1
player_id = 1
sklad_meczowy_id = 1
event_id = 1
card_id = 1
goal_id = 1
sub_id = 1

unique_referees = {}
unique_teams = {}
unique_players = {}


sql_referees = []
sql_teams = []
sql_matches = []
sql_players = []
sql_team_apperance = []
sql_event = []
sql_event_goal = []
sql_event_sub = []
sql_event_card = []

def random_date():
    start = datetime(1990, 1, 1)
    end = datetime(2008, 12, 31)
    return (start + timedelta(days=random.randint(0, (end - start).days))).strftime("%Y-%m-%d")


for match in data:
    
    match_id = match['match_id']
    referees = match['referees']
    teams_names = match['match_details']['teams']
    home_team = match['match_details']['teams']['home']
    away_team = match['match_details']['teams']['away']
    match_date = match['match_details']['date']
    match_time = match['match_details']['time']
    match_result = match['match_details']['scores']
    match_week = match['match_details']['week']
    players = match['players']
    events  = match['events']


    licznikbase = 0
    for role, referee_name in referees.items():
        if referee_name not in unique_referees:
            unique_referees[referee_name] = referee_id
            surname, first_name = referee_name.split()
            poziom = '4' if role == "center" else random.choice(['5', 'A', 'B'])
            sql_referees.append(
                f"INSERT INTO Sedzia (SedziaID, Imie, Nazwisko, Kraj, Poziom) VALUES ({referee_id}, '{first_name}', '{surname}', 'Polska', '{poziom}');"
            )
            referee_id += 1

    for side, team_name in teams_names.items():
        if team_name not in unique_teams:
            unique_teams[team_name] = team_id
            sql_teams.append(
                f"INSERT INTO Klub (KlubID, Nazwa) VALUES ({team_id}, '{team_name}');"
            )
            team_id += 1
    

    sql_matches.append(
        f"INSERT INTO Mecz (MeczID, KlubGospID, KlubGoscID, SedziaGlownyID, SedziaAs1ID, SedziaAs2ID, DataMeczu, WynikKoncowy, NrKolejki) "
        f"VALUES ({match_id}, {unique_teams[teams_names['home']]}, {unique_teams[teams_names['away']]}, "
        f"{unique_referees[referees['center']]}, {unique_referees[referees['assistant_1']]}, "
        f"{unique_referees[referees['assistant_2']]}, TO_DATE('{match_date}', 'YYYY-MM-DD'), '{match_result['home']}:{match_result['away']}', {match_week.split('.')[0]});"
    )

   
    for team_side, teams in players.items():
        for category, players_list in teams.items():
            if category == "base":
                positions = ['B'] + ['O'] * 4 + ['P'] * 3 + ['N'] * 3
                random.shuffle(positions)
                for player_name, position in zip(players_list, positions):
                    unique_key_players = f"{player_name}-{teams_names[team_side]}"
                    
                    if unique_key_players not in unique_players:
                        player_name_split = player_name.split()
                        surname = player_name_split[:-1]
                        first_name = player_name_split[-1]
                        unique_players[unique_key_players] = player_id
                        birth_date = random_date()
                        sql_players.append(
                            f"INSERT INTO Zawodnik(ZawodnikID, KlubID, Imie, Nazwisko, CzyBadaniaZdrowotne, DataUrodzenia, Pozycja) "
                            f"Values ({player_id}, {unique_teams[teams_names[team_side]]}, '{first_name}', '{' '.join(surname)}', 'TAK', TO_DATE('{birth_date}', 'YYYY-MM-DD'), '{position}');"
                        )
                        player_id += 1
                    
                    sql_team_apperance.append(
                        f"INSERT INTO SkladMeczowy(SkladMeczowyID, ZawodnikID, MeczID, RolaWSkladzie) "
                        f"Values ({sklad_meczowy_id}, {unique_players[unique_key_players]}, {match_id}, 'P');"
                    )
                    sklad_meczowy_id += 1

            elif category == "reserve":
                for player_name in players_list:
                    position = random.choice(['B', 'O', 'P', 'N'])
                    unique_key_players = f"{player_name}-{teams_names[team_side]}"
                    
                    if unique_key_players not in unique_players:
                        player_name_split = player_name.split()
                        surname = player_name_split[:-1]
                        first_name = player_name_split[-1]
                        unique_players[unique_key_players] = player_id
                        birth_date = random_date()
                        sql_players.append(
                            f"INSERT INTO Zawodnik(ZawodnikID, KlubID, Imie, Nazwisko, CzyBadaniaZdrowotne, DataUrodzenia, Pozycja) "
                            f"Values ({player_id}, {unique_teams[teams_names[team_side]]}, '{first_name}', '{' '.join(surname)}', 'TAK', TO_DATE('{birth_date}', 'YYYY-MM-DD'), '{position}');"
                        )
                        player_id += 1
                    
                    sql_team_apperance.append(
                        f"INSERT INTO SkladMeczowy(SkladMeczowyID, ZawodnikID, MeczID, RolaWSkladzie) "
                        f"Values ({sklad_meczowy_id}, {unique_players[unique_key_players]}, {match_id}, 'R');"
                    )
                    sklad_meczowy_id += 1

    for event in events:
        team_side = event['team']
        minute = event['minute']
        player = event['event']
        event_type = event['event_type']
 
        if event_type == 'change':
            player_out_name = player.split('.')[0]
            player_in_name = player.split('.')[1]
            unique_key_player_out = f"{player_out_name}-{teams_names[team_side]}"
            unique_key_player_in = f"{player_in_name}-{teams_names[team_side]}"
            sql_event_sub.append(
                f"INSERT INTO ZdarzenieMeczZmiana(ZmianaID, ZdarzenieMeczID, ZawodnikWchodzacyID, ZawodnikSchodzacyID)"
                f"Values ({sub_id}, {event_id}, {unique_players[unique_key_player_in]}, {unique_players[unique_key_player_out]});"
            )
            sub_id +=1
            new_event_type = 'Zmiana'

        elif event_type in ['goal','own_goal','pen_goal']:
            if event_type == 'goal':
                goal_type = 'zwykly'
            elif event_type == 'own_goal':
                if team_side == 'away':
                        team_side = 'home'
                else:
                        team_side = 'away'
                goal_type = 'samoboj'
            else:
                goal_type = 'karny'
            unique_key_player = f"{player}-{teams_names[team_side]}"
            sql_event_goal.append(
                f"INSERT INTO ZdarzenieMeczGol(GolID, ZdarzenieMeczID, ZawodnikStrzelajacyID, TypGola)"
                f"Values ({goal_id}, {event_id}, {unique_players[unique_key_player]}, '{goal_type}');"
            )
            goal_id += 1
            new_event_type = 'Gol'
 

        elif event_type in ['yellow_card', 'red_card']:
            card_name = 'Zolta' if event_type == 'yellow_card' else 'Czerwona'
            unique_key_player = f"{player}-{teams_names[team_side]}"
            sql_event_card.append(
                f"INSERT INTO ZdarzenieMeczKartka(KartkaID, ZdarzenieMeczID, ZawodnikKartkowanyID, KolorKartki)"
                f"Values ({card_id}, {event_id}, {unique_players[unique_key_player]}, '{card_name}');"
            )
            card_id += 1
            new_event_type = "Kartka"
        if '+' in minute:
            minute = minute[:-1]
        sql_event.append(
            f"INSERT INTO ZdarzenieMecz(ZdarzenieMeczID, MeczID, SedziaID, Minuta, TypZdarzenieMecz) "
            f"Values ({event_id}, {match_id}, {unique_referees[referees['center']]}, {minute}, '{new_event_type}');"
        )
        event_id += 1 

                    


print(licznikbase)


with open('sedzia.sql', 'w', encoding='utf-8') as file:
    file.write('\n'.join(sql_referees))

with open('mecz.sql', 'w', encoding='utf-8') as file:
    file.write('\n'.join(sql_matches))

with open('zawodnicy.sql', 'w', encoding='utf-8') as file:
    file.write('\n'.join(sql_players))

with open('skladmeczowy.sql', 'w', encoding='utf-8') as file:
    file.write('\n'.join(sql_team_apperance))

with open('zdarzeniemecz.sql', 'w', encoding='utf-8') as file:
    file.write('\n'.join(sql_event))

with open('zdarzeniemeczgol.sql', 'w', encoding='utf-8') as file:
    file.write('\n'.join(sql_event_goal))

with open('zdarzeniemeczkartka.sql', 'w', encoding='utf-8') as file:
    file.write('\n'.join(sql_event_card))

with open('zdarzeniemeczzmiana.sql', 'w', encoding='utf-8') as file:
    file.write('\n'.join(sql_event_sub))



print("Zapytania SQL zostały wygenerowane!")