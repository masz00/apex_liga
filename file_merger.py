
files = [
    'createtable.sql', 'liga.sql', 'stadion.sql', 'trener.sql','sedzia.sql', 
    'kluby.sql','mecz.sql', 'zawodnicy.sql', 
    'zdarzeniemecz.sql', 'zdarzeniemeczgol.sql',
    'zdarzeniemeczkartka.sql', 'zdarzeniemeczzmiana.sql',
    'skladmeczowy.sql',
]

output_file = 'all_data_new.sql'

with open(output_file, 'w', encoding='utf-8') as output:
    for file_name in files:
        try:
            with open(file_name, 'r', encoding='utf-8') as file:
                data = file.read()
                output.write(f"-- Dane z pliku: {file_name} --\n")
                output.write(data + "\n\n")
        except FileNotFoundError:
            print(f"Plik {file_name} nie został znaleziony.")
        except Exception as e:
            print(f"Wystąpił błąd przy przetwarzaniu pliku {file_name}: {e}")

print(f"Dane zostały zapisane w pliku {output_file}.")