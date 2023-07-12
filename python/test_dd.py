with open('ai_sync_yc_2023.txt', 'r') as file:
    lines = file.readlines()

new_lines = [line + "\n" for line in lines if 'You' not in line]

with open('ai_sync_yc_2023.txt', 'w') as file:
    file.writelines(new_lines)
