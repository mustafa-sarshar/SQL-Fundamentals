"""
This python script will create some tables including random data for educational purposes.
"""
#%% Import Libs
import sys
import pandas as pd
import names
from random_word import RandomWords
from random import randint, random, choice
from csv import writer

#%% Init a database
rw = RandomWords()
OPERATIONS_LENGTH_LIMIT = 1000
COUNTRIES = [               # Source: https://pytutorial.com/python-get-random-country (accessed on 05.09.2022)
    ('US', 'United States'),
    ('AF', 'Afghanistan'),
    ('AL', 'Albania'),
    ('DZ', 'Algeria'),
    ('AS', 'American Samoa'),
    ('AD', 'Andorra'),
    ('AO', 'Angola'),
    ('AI', 'Anguilla'),
    ('AQ', 'Antarctica'),
    ('AG', 'Antigua And Barbuda'),
    ('AR', 'Argentina'),
    ('AM', 'Armenia'),
    ('AW', 'Aruba'),
    ('AU', 'Australia'),
    ('AT', 'Austria'),
    ('AZ', 'Azerbaijan'),
    ('BS', 'Bahamas'),
    ('BH', 'Bahrain'),
    ('BD', 'Bangladesh'),
    ('BB', 'Barbados'),
    ('BY', 'Belarus'),
    ('BE', 'Belgium'),
    ('BZ', 'Belize'),
    ('BJ', 'Benin'),
    ('BM', 'Bermuda'),
    ('BT', 'Bhutan'),
    ('BO', 'Bolivia'),
    ('BA', 'Bosnia And Herzegowina'),
    ('BW', 'Botswana'),
    ('BV', 'Bouvet Island'),
    ('BR', 'Brazil'),
    ('BN', 'Brunei Darussalam'),
    ('BG', 'Bulgaria'),
    ('BF', 'Burkina Faso'),
    ('BI', 'Burundi'),
    ('KH', 'Cambodia'),
    ('CM', 'Cameroon'),
    ('CA', 'Canada'),
    ('CV', 'Cape Verde'),
    ('KY', 'Cayman Islands'),
    ('CF', 'Central African Rep'),
    ('TD', 'Chad'),
    ('CL', 'Chile'),
    ('CN', 'China'),
    ('CX', 'Christmas Island'),
    ('CC', 'Cocos Islands'),
    ('CO', 'Colombia'),
    ('KM', 'Comoros'),
    ('CG', 'Congo'),
    ('CK', 'Cook Islands'),
    ('CR', 'Costa Rica'),
    ('CI', 'Cote D`ivoire'),
    ('HR', 'Croatia'),
    ('CU', 'Cuba'),
    ('CY', 'Cyprus'),
    ('CZ', 'Czech Republic'),
    ('DK', 'Denmark'),
    ('DJ', 'Djibouti'),
    ('DM', 'Dominica'),
    ('DO', 'Dominican Republic'),
    ('TP', 'East Timor'),
    ('EC', 'Ecuador'),
    ('EG', 'Egypt'),
    ('SV', 'El Salvador'),
    ('GQ', 'Equatorial Guinea'),
    ('ER', 'Eritrea'),
    ('EE', 'Estonia'),
    ('ET', 'Ethiopia'),
    ('FK', 'Falkland Islands (Malvinas)'),
    ('FO', 'Faroe Islands'),
    ('FJ', 'Fiji'),
    ('FI', 'Finland'),
    ('FR', 'France'),
    ('GF', 'French Guiana'),
    ('PF', 'French Polynesia'),
    ('TF', 'French S. Territories'),
    ('GA', 'Gabon'),
    ('GM', 'Gambia'),
    ('GE', 'Georgia'),
    ('DE', 'Germany'),
    ('GH', 'Ghana'),
    ('GI', 'Gibraltar'),
    ('GR', 'Greece'),
    ('GL', 'Greenland'),
    ('GD', 'Grenada'),
    ('GP', 'Guadeloupe'),
    ('GU', 'Guam'),
    ('GT', 'Guatemala'),
    ('GN', 'Guinea'),
    ('GW', 'Guinea-bissau'),
    ('GY', 'Guyana'),
    ('HT', 'Haiti'),
    ('HN', 'Honduras'),
    ('HK', 'Hong Kong'),
    ('HU', 'Hungary'),
    ('IS', 'Iceland'),
    ('IN', 'India'),
    ('ID', 'Indonesia'),
    ('IR', 'Iran'),
    ('IQ', 'Iraq'),
    ('IE', 'Ireland'),
    ('IL', 'Israel'),
    ('IT', 'Italy'),
    ('JM', 'Jamaica'),
    ('JP', 'Japan'),
    ('JO', 'Jordan'),
    ('KZ', 'Kazakhstan'),
    ('KE', 'Kenya'),
    ('KI', 'Kiribati'),
    ('KP', 'Korea (North)'),
    ('KR', 'Korea (South)'),
    ('KW', 'Kuwait'),
    ('KG', 'Kyrgyzstan'),
    ('LA', 'Laos'),
    ('LV', 'Latvia'),
    ('LB', 'Lebanon'),
    ('LS', 'Lesotho'),
    ('LR', 'Liberia'),
    ('LY', 'Libya'),
    ('LI', 'Liechtenstein'),
    ('LT', 'Lithuania'),
    ('LU', 'Luxembourg'),
    ('MO', 'Macau'),
    ('MK', 'Macedonia'),
    ('MG', 'Madagascar'),
    ('MW', 'Malawi'),
    ('MY', 'Malaysia'),
    ('MV', 'Maldives'),
    ('ML', 'Mali'),
    ('MT', 'Malta'),
    ('MH', 'Marshall Islands'),
    ('MQ', 'Martinique'),
    ('MR', 'Mauritania'),
    ('MU', 'Mauritius'),
    ('YT', 'Mayotte'),
    ('MX', 'Mexico'),
    ('FM', 'Micronesia'),
    ('MD', 'Moldova'),
    ('MC', 'Monaco'),
    ('MN', 'Mongolia'),
    ('MS', 'Montserrat'),
    ('MA', 'Morocco'),
    ('MZ', 'Mozambique'),
    ('MM', 'Myanmar'),
    ('NA', 'Namibia'),
    ('NR', 'Nauru'),
    ('NP', 'Nepal'),
    ('NL', 'Netherlands'),
    ('AN', 'Netherlands Antilles'),
    ('NC', 'New Caledonia'),
    ('NZ', 'New Zealand'),
    ('NI', 'Nicaragua'),
    ('NE', 'Niger'),
    ('NG', 'Nigeria'),
    ('NU', 'Niue'),
    ('NF', 'Norfolk Island'),
    ('MP', 'Northern Mariana Islands'),
    ('NO', 'Norway'),
    ('OM', 'Oman'),
    ('PK', 'Pakistan'),
    ('PW', 'Palau'),
    ('PA', 'Panama'),
    ('PG', 'Papua New Guinea'),
    ('PY', 'Paraguay'),
    ('PE', 'Peru'),
    ('PH', 'Philippines'),
    ('PN', 'Pitcairn'),
    ('PL', 'Poland'),
    ('PT', 'Portugal'),
    ('PR', 'Puerto Rico'),
    ('QA', 'Qatar'),
    ('RE', 'Reunion'),
    ('RO', 'Romania'),
    ('RU', 'Russian Federation'),
    ('RW', 'Rwanda'),
    ('KN', 'Saint Kitts And Nevis'),
    ('LC', 'Saint Lucia'),
    ('VC', 'St Vincent/Grenadines'),
    ('WS', 'Samoa'),
    ('SM', 'San Marino'),
    ('ST', 'Sao Tome'),
    ('SA', 'Saudi Arabia'),
    ('SN', 'Senegal'),
    ('SC', 'Seychelles'),
    ('SL', 'Sierra Leone'),
    ('SG', 'Singapore'),
    ('SK', 'Slovakia'),
    ('SI', 'Slovenia'),
    ('SB', 'Solomon Islands'),
    ('SO', 'Somalia'),
    ('ZA', 'South Africa'),
    ('ES', 'Spain'),
    ('LK', 'Sri Lanka'),
    ('SH', 'St. Helena'),
    ('PM', 'St.Pierre'),
    ('SD', 'Sudan'),
    ('SR', 'Suriname'),
    ('SZ', 'Swaziland'),
    ('SE', 'Sweden'),
    ('CH', 'Switzerland'),
    ('SY', 'Syrian Arab Republic'),
    ('TW', 'Taiwan'),
    ('TJ', 'Tajikistan'),
    ('TZ', 'Tanzania'),
    ('TH', 'Thailand'),
    ('TG', 'Togo'),
    ('TK', 'Tokelau'),
    ('TO', 'Tonga'),
    ('TT', 'Trinidad And Tobago'),
    ('TN', 'Tunisia'),
    ('TR', 'Turkey'),
    ('TM', 'Turkmenistan'),
    ('TV', 'Tuvalu'),
    ('UG', 'Uganda'),
    ('UA', 'Ukraine'),
    ('AE', 'United Arab Emirates'),
    ('UK', 'United Kingdom'),
    ('UY', 'Uruguay'),
    ('UZ', 'Uzbekistan'),
    ('VU', 'Vanuatu'),
    ('VA', 'Vatican City State'),
    ('VE', 'Venezuela'),
    ('VN', 'Viet Nam'),
    ('VG', 'Virgin Islands (British)'),
    ('VI', 'Virgin Islands (U.S.)'),
    ('YE', 'Yemen'),
    ('YU', 'Yugoslavia'),
    ('ZR', 'Zaire'),
    ('ZM', 'Zambia'),
    ('ZW', 'Zimbabwe')
]
GENDERS = (
    "male",
    "female"
)
SALARY_SCALE_FACTOR = (
    100_000,
    1_000_000,
    10_000_000
)
SALARY_OFFSET = 100_000
AGE_RANGE = (18, 40)
N_TEAMS = 1_000
N_PLAYERS = 1_000

DEBUG = True
TRACE = False

if len(sys.argv) > 1:
    N_TEAMS = int(sys.argv[1])
if len(sys.argv) > 2:
    N_PLAYERS = int(sys.argv[2])
if len(sys.argv) > 3:
    DEBUG = eval(sys.argv[3])
if len(sys.argv) > 4:
    TRACE = eval(sys.argv[4])

#%% Custome Functions
def get_a_random_team_name():
    team_name = None
    while(team_name == None):
        team_name = rw.get_random_word(hasDictionaryDef="true", includePartOfSpeech="noun,verb", minCorpusCount=1, maxCorpusCount=10, minDictionaryCount=1, maxDictionaryCount=10, minLength=5, maxLength=10)
    return team_name.capitalize()

def create_dataset_team(num=0):
    lst_teams = []
    for idx_team in range(num):
        team_name = get_a_random_team_name()
        # team_name = "Team " + str(idx_team+1)
        dict_team = dict(
            team_id=idx_team,
            name=team_name,
            country=choice(COUNTRIES)[1]
        )
        lst_teams.append(dict_team)
        if TRACE: print(lst_teams[-1])
    return lst_teams

def create_dataset_contracts(num=0):
    lst_contracts = []
    idx_contract = 0
    for idx_player in range(num):
        n_contracts = randint(1, 5)
        for _ in range(n_contracts):
            salary = int(random() * SALARY_SCALE_FACTOR[int(random() * len(SALARY_SCALE_FACTOR))]) + SALARY_OFFSET
            dict_contracts = dict(
                contract_id=idx_contract,
                player_id=idx_player,
                salary=salary
            )
            lst_contracts.append(dict_contracts)
            if TRACE: print(lst_contracts[-1])
            idx_contract += 1
    return lst_contracts

def create_dataset_players(num=0):
    lst_players = []
    for idx_player in range(num):
        gender = choice(GENDERS)
        dict_player = dict(
            player_id=idx_player,
            gender=gender,
            fname=names.get_first_name(gender=gender),
            lname=names.get_last_name(),
            age=randint(AGE_RANGE[0], AGE_RANGE[1]),
            team_id=randint(0, N_TEAMS),
            birthplace=choice(COUNTRIES)[1]
        )
        lst_players.append(dict_player)
        if TRACE: print(lst_players[-1])
    return lst_players

def append_list_as_row(file_name, list_of_elem):
    # Open file in append mode
    with open(file_name, 'a+', newline='') as write_obj:
        # Create a writer object from csv module
        csv_writer = writer(write_obj)
        # Add contents of list as last row in the csv file
        csv_writer.writerow(list_of_elem)
#### Generate fake data
#%% Create the fake team dataset
num = 0
if N_TEAMS > OPERATIONS_LENGTH_LIMIT:
    num = OPERATIONS_LENGTH_LIMIT - N_TEAMS
    lst_teams = create_dataset_team(N_TEAMS)
    df_teams = pd.DataFrame(lst_teams)


df_teams.to_csv("teams.csv", index=False)
if DEBUG: print(f"{len(df_teams)} teams generated and saved as .csv file.")
del df_teams, lst_teams

#%%


lst_contracts = create_dataset_contracts(N_PLAYERS)
df_contracts = pd.DataFrame(lst_contracts)
df_contracts.to_csv("contracts.csv", index=False)
if DEBUG: print(f"{len(df_contracts)} contracts generated and saved as .csv file.")
del df_contracts, lst_contracts

#%%



lst_players = create_dataset_players(N_PLAYERS)
df_players = pd.DataFrame(lst_players)
df_players.to_csv("players.csv", index=False)
if DEBUG: print(f"{len(df_players)} players generated and saved as .csv file.")
del df_players, lst_players

# %%
print("Finish!")