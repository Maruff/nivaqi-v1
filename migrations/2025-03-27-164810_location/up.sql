-- Your SQL goes here 2025-03-27-203600_location
-- Create country, state, and city table
CREATE TABLE country (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    code VARCHAR(10) NOT NULL UNIQUE,
    active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE state (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    code VARCHAR(10) NOT NULL,
    country_id INT NOT NULL,
    active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (country_id) REFERENCES country(id) ON DELETE CASCADE
);

CREATE TABLE city (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    state_id INT NOT NULL,
    active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (state_id) REFERENCES state(id) ON DELETE CASCADE
);

-- Insert default countries
INSERT INTO country (name, code) VALUES
    ('Afghanistan', 'AF'),
    ('Albania', 'AL'),
    ('Algeria', 'DZ'),
    ('Andorra', 'AD'),
    ('Angola', 'AO'),
    ('Antigua and Barbuda', 'AG'),
    ('Argentina', 'AR'),
    ('Armenia', 'AM'),
    ('Australia', 'AU'),
    ('Austria', 'AT'),
    ('Azerbaijan', 'AZ'),
    ('Bahamas', 'BS'),
    ('Bahrain', 'BH'),
    ('Bangladesh', 'BD'),
    ('Barbados', 'BB'),
    ('Belarus', 'BY'),
    ('Belgium', 'BE'),
    ('Belize', 'BZ'),
    ('Benin', 'BJ'),
    ('Bhutan', 'BT'),
    ('Bolivia', 'BO'),
    ('Bosnia and Herzegovina', 'BA'),
    ('Botswana', 'BW'),
    ('Brazil', 'BR'),
    ('Brunei', 'BN'),
    ('Bulgaria', 'BG'),
    ('Burkina Faso', 'BF'),
    ('Burundi', 'BI'),
    ('Cabo Verde', 'CV'),
    ('Cambodia', 'KH'),
    ('Cameroon', 'CM'),
    ('Canada', 'CA'),
    ('Central African Republic', 'CF'),
    ('Chad', 'TD'),
    ('Chile', 'CL'),
    ('China', 'CN'),
    ('Colombia', 'CO'),
    ('Comoros', 'KM'),
    ('Congo (Congo-Brazzaville)', 'CG'),
    ('Congo (Democratic Republic)', 'CD'),
    ('Costa Rica', 'CR'),
    ('Croatia', 'HR'),
    ('Cuba', 'CU'),
    ('Cyprus', 'CY'),
    ('Czechia', 'CZ'),
    ('Denmark', 'DK'),
    ('Djibouti', 'DJ'),
    ('Dominica', 'DM'),
    ('Dominican Republic', 'DO'),
    ('Ecuador', 'EC'),
    ('Egypt', 'EG'),
    ('El Salvador', 'SV'),
    ('Equatorial Guinea', 'GQ'),
    ('Eritrea', 'ER'),
    ('Estonia', 'EE'),
    ('Eswatini', 'SZ'),
    ('Ethiopia', 'ET'),
    ('Fiji', 'FJ'),
    ('Finland', 'FI'),
    ('France', 'FR'),
    ('Gabon', 'GA'),
    ('Gambia', 'GM'),
    ('Georgia', 'GE'),
    ('Germany', 'DE'),
    ('Ghana', 'GH'),
    ('Greece', 'GR'),
    ('Grenada', 'GD'),
    ('Guatemala', 'GT'),
    ('Guinea', 'GN'),
    ('Guinea-Bissau', 'GW'),
    ('Guyana', 'GY'),
    ('Haiti', 'HT'),
    ('Honduras', 'HN'),
    ('Hungary', 'HU'),
    ('Iceland', 'IS'),
    ('India', 'IN'),
    ('Indonesia', 'ID'),
    ('Iran', 'IR'),
    ('Iraq', 'IQ'),
    ('Ireland', 'IE'),
    ('Israel', 'IL'),
    ('Italy', 'IT'),
    ('Jamaica', 'JM'),
    ('Japan', 'JP'),
    ('Jordan', 'JO'),
    ('Kazakhstan', 'KZ'),
    ('Kenya', 'KE'),
    ('Kiribati', 'KI'),
    ('Kuwait', 'KW'),
    ('Kyrgyzstan', 'KG'),
    ('Laos', 'LA'),
    ('Latvia', 'LV'),
    ('Lebanon', 'LB'),
    ('Lesotho', 'LS'),
    ('Liberia', 'LR'),
    ('Libya', 'LY'),
    ('Liechtenstein', 'LI'),
    ('Lithuania', 'LT'),
    ('Luxembourg', 'LU'),
    ('Madagascar', 'MG'),
    ('Malawi', 'MW'),
    ('Malaysia', 'MY'),
    ('Maldives', 'MV'),
    ('Mali', 'ML'),
    ('Malta', 'MT'),
    ('Marshall Islands', 'MH'),
    ('Mauritania', 'MR'),
    ('Mauritius', 'MU'),
    ('Mexico', 'MX'),
    ('Micronesia', 'FM'),
    ('Moldova', 'MD'),
    ('Monaco', 'MC'),
    ('Mongolia', 'MN'),
    ('Montenegro', 'ME'),
    ('Morocco', 'MA'),
    ('Mozambique', 'MZ'),
    ('Myanmar', 'MM'),
    ('Namibia', 'NA'),
    ('Nauru', 'NR'),
    ('Nepal', 'NP'),
    ('Netherlands', 'NL'),
    ('New Zealand', 'NZ'),
    ('Nicaragua', 'NI'),
    ('Niger', 'NE'),
    ('Nigeria', 'NG'),
    ('North Korea', 'KP'),
    ('North Macedonia', 'MK'),
    ('Norway', 'NO'),
    ('Oman', 'OM'),
    ('Pakistan', 'PK'),
    ('Palau', 'PW'),
    ('Panama', 'PA'),
    ('Papua New Guinea', 'PG'),
    ('Paraguay', 'PY'),
    ('Peru', 'PE'),
    ('Philippines', 'PH'),
    ('Poland', 'PL'),
    ('Portugal', 'PT'),
    ('Qatar', 'QA'),
    ('Romania', 'RO'),
    ('Russia', 'RU'),
    ('Rwanda', 'RW'),
    ('Saint Kitts and Nevis', 'KN'),
    ('Saint Lucia', 'LC'),
    ('Saint Vincent and the Grenadines', 'VC'),
    ('Samoa', 'WS'),
    ('San Marino', 'SM'),
    ('Sao Tome and Principe', 'ST'),
    ('Saudi Arabia', 'SA'),
    ('Senegal', 'SN'),
    ('Serbia', 'RS'),
    ('Seychelles', 'SC'),
    ('Sierra Leone', 'SL'),
    ('Singapore', 'SG'),
    ('Slovakia', 'SK'),
    ('Slovenia', 'SI'),
    ('Solomon Islands', 'SB'),
    ('Somalia', 'SO'),
    ('South Africa', 'ZA'),
    ('South Korea', 'KR'),
    ('South Sudan', 'SS'),
    ('Spain', 'ES'),
    ('Sri Lanka', 'LK'),
    ('Sudan', 'SD'),
    ('Suriname', 'SR'),
    ('Sweden', 'SE'),
    ('Switzerland', 'CH'),
    ('Syria', 'SY'),
    ('Tajikistan', 'TJ'),
    ('Tanzania', 'TZ'),
    ('Thailand', 'TH'),
    ('Timor-Leste', 'TL'),
    ('Togo', 'TG'),
    ('Tonga', 'TO'),
    ('Trinidad and Tobago', 'TT'),
    ('Tunisia', 'TN'),
    ('Turkey', 'TR'),
    ('Turkmenistan', 'TM'),
    ('Tuvalu', 'TV'),
    ('Uganda', 'UG'),
    ('Ukraine', 'UA'),
    ('United Arab Emirates', 'AE'),
    ('United Kingdom', 'GB'),
    ('United States', 'US'),
    ('Uruguay', 'UY'),
    ('Uzbekistan', 'UZ'),
    ('Vanuatu', 'VU'),
    ('Vatican City', 'VA'),
    ('Venezuela', 'VE'),
    ('Vietnam', 'VN'),
    ('Yemen', 'YE'),
    ('Zambia', 'ZM'),
    ('Zimbabwe', 'ZW');


-- Insert default states
INSERT INTO state (name, code, country_id) VALUES
    ('Badakhshan', 'BDS', 1),
    ('Badghis', 'BDG', 1),
    ('Baghlan', 'BGL', 1),
    ('Balkh', 'BLK', 1),
    ('Bamyan', 'BMY', 1),
    ('Daykundi', 'DKD', 1),
    ('Farah', 'FRA', 1),
    ('Faryab', 'FYB', 1),
    ('Ghazni', 'GHA', 1),
    ('Ghor', 'GHO', 1),
    ('Helmand', 'HIL', 1),
    ('Herat', 'HER', 1),
    ('Jowzjan', 'JOW', 1),
    ('Kabul', 'KAB', 1),
    ('Kandahar', 'KAN', 1),
    ('Kapisa', 'KAP', 1),
    ('Khost', 'KHO', 1),
    ('Kunar', 'KNR', 1),
    ('Kunduz', 'KDZ', 1),
    ('Laghman', 'LGM', 1),
    ('Logar', 'LOG', 1),
    ('Nangarhar', 'NAN', 1),
    ('Nimroz', 'NIM', 1),
    ('Nuristan', 'NUR', 1),
    ('Paktia', 'PKT', 1),
    ('Paktika', 'PKA', 1),
    ('Panjshir', 'PAN', 1),
    ('Parwan', 'PAR', 1),
    ('Samangan', 'SAM', 1),
    ('Sar-e Pol', 'SAR', 1),
    ('Takhar', 'TAK', 1),
    ('Urozgan', 'URU', 1),
    ('Zabul', 'ZAB', 1),
    ('Berat', 'BR', 2),
    ('Dibër', 'DI', 2),
    ('Durrës', 'DR', 2),
    ('Elbasan', 'EL', 2),
    ('Fier', 'FR', 2),
    ('Gjirokastër', 'GJ', 2),
    ('Korçë', 'KO', 2),
    ('Kukës', 'KU', 2),
    ('Lezhë', 'LE', 2),
    ('Shkodër', 'SH', 2),
    ('Tiranë', 'TR', 2),
    ('Vlorë', 'VL', 2),
    ('Adrar', '01', 3),
    ('Chlef', '02', 3),
    ('Laghouat', '03', 3),
    ('Oum El Bouaghi', '04', 3),
    ('Batna', '05', 3),
    ('Béjaïa', '06', 3),
    ('Biskra', '07', 3),
    ('Béchar', '08', 3),
    ('Blida', '09', 3),
    ('Bouira', '10', 3),
    ('Tamanrasset', '11', 3),
    ('Tébessa', '12', 3),
    ('Tlemcen', '13', 3),
    ('Tiaret', '14', 3),
    ('Tizi Ouzou', '15', 3),
    ('Alger', '16', 3),
    ('Djelfa', '17', 3),
    ('Jijel', '18', 3),
    ('Sétif', '19', 3),
    ('Saïda', '20', 3),
    ('Skikda', '21', 3),
    ('Sidi Bel Abbès', '22', 3),
    ('Annaba', '23', 3),
    ('Guelma', '24', 3),
    ('Constantine', '25', 3),
    ('Médéa', '26', 3),
    ('Mostaganem', '27', 3),
    ('MSila', '28', 3),
    ('Mascara', '29', 3),
    ('Ouargla', '30', 3),
    ('Oran', '31', 3),
    ('El Bayadh', '32', 3),
    ('Illizi', '33', 3),
    ('Bordj Bou Arréridj', '34', 3),
    ('Boumerdès', '35', 3),
    ('El Tarf', '36', 3),
    ('Tindouf', '37', 3),
    ('Tissemsilt', '38', 3),
    ('El Oued', '39', 3),
    ('Khenchela', '40', 3),
    ('Souk Ahras', '41', 3),
    ('Tipaza', '42', 3),
    ('Mila', '43', 3),
    ('Aïn Defla', '44', 3),
    ('Naâma', '45', 3),
    ('Aïn Témouchent', '46', 3),
    ('Ghardaïa', '47', 3),
    ('Relizane', '48', 3),
    ('Andhra Pradesh', 'AP', 76),
    ('Arunachal Pradesh', 'AR', 76),
    ('Assam', 'AS', 76),
    ('Bihar', 'BR', 76),
    ('Chhattisgarh', 'CG', 76),
    ('Goa', 'GA', 76),
    ('Gujarat', 'GJ', 76),
    ('Haryana', 'HR', 76),
    ('Himachal Pradesh', 'HP', 76),
    ('Jharkhand', 'JH', 76),
    ('Karnataka', 'KA', 76),
    ('Kerala', 'KL', 76),
    ('Madhya Pradesh', 'MP', 76),
    ('Maharashtra', 'MH', 76),
    ('Manipur', 'MN', 76),
    ('Meghalaya', 'ML', 76),
    ('Mizoram', 'MZ', 76),
    ('Nagaland', 'NL', 76),
    ('Odisha', 'OR', 76),
    ('Punjab', 'PB', 76),
    ('Rajasthan', 'RJ', 76),
    ('Sikkim', 'SK', 76),
    ('Tamil Nadu', 'TN', 76),
    ('Telangana', 'TG', 76),
    ('Tripura', 'TR', 76),
    ('Uttar Pradesh', 'UP', 76),
    ('Uttarakhand', 'UK', 76),
    ('West Bengal', 'WB', 76),
    ('Andaman and Nicobar Islands', 'AN', 76),
    ('Chandigarh', 'CH', 76),
    ('Dadra and Nagar Haveli and Daman and Diu', 'DN', 76),
    ('Delhi', 'DL', 76),
    ('Jammu and Kashmir', 'JK', 76),
    ('Ladakh', 'LA', 76),
    ('Lakshadweep', 'LD', 76),
    ('Puducherry', 'PY', 76),
    ('New South Wales', 'NSW', 9),
    ('Victoria', 'VIC', 9),
    ('Queensland', 'QLD', 9),
    ('Western Australia', 'WA', 9),
    ('South Australia', 'SA', 9),
    ('Tasmania', 'TAS', 9),
    ('Australian Capital Territory', 'ACT', 9),
    ('Northern Territory', 'NT', 9),
    ('Alabama', 'AL', 184),
    ('Alaska', 'AK', 184),
    ('Arizona', 'AZ', 184),
    ('Arkansas', 'AR', 184),
    ('California', 'CA', 184),
    ('Colorado', 'CO', 184),
    ('Connecticut', 'CT', 184),
    ('Delaware', 'DE', 184),
    ('Florida', 'FL', 184),
    ('Georgia', 'GA', 184),
    ('Hawaii', 'HI', 184),
    ('Idaho', 'ID', 184),
    ('Illinois', 'IL', 184),
    ('Indiana', 'IN', 184),
    ('Iowa', 'IA', 184),
    ('Kansas', 'KS', 184),
    ('Kentucky', 'KY', 184),
    ('Louisiana', 'LA', 184),
    ('Maine', 'ME', 184),
    ('Maryland', 'MD', 184),
    ('Massachusetts', 'MA', 184),
    ('Michigan', 'MI', 184),
    ('Minnesota', 'MN', 184),
    ('Mississippi', 'MS', 184),
    ('Missouri', 'MO', 184),
    ('Montana', 'MT', 184),
    ('Nebraska', 'NE', 184),
    ('Nevada', 'NV', 184),
    ('New Hampshire', 'NH', 184),
    ('New Jersey', 'NJ', 184),
    ('New Mexico', 'NM', 184),
    ('New York', 'NY', 184),
    ('North Carolina', 'NC', 184),
    ('North Dakota', 'ND', 184),
    ('Ohio', 'OH', 184),
    ('Oklahoma', 'OK', 184),
    ('Oregon', 'OR', 184),
    ('Pennsylvania', 'PA', 184),
    ('Rhode Island', 'RI', 184),
    ('South Carolina', 'SC', 184),
    ('South Dakota', 'SD', 184),
    ('Tennessee', 'TN', 184),
    ('Texas', 'TX', 184),
    ('Utah', 'UT', 184),
    ('Vermont', 'VT', 184),
    ('Virginia', 'VA', 184),
    ('Washington', 'WA', 184),
    ('West Virginia', 'WV', 184),
    ('Wisconsin', 'WI', 184),
    ('Wyoming', 'WY', 184),
    ('District of Columbia', 'DC', 184),
    ('American Samoa', 'AS', 184),
    ('Guam', 'GU', 184),
    ('Northern Mariana Islands', 'MP', 184),
    ('Puerto Rico', 'PR', 184),
    ('United States Virgin Islands', 'VI', 184),
    ('England', 'ENG', 183),
    ('Scotland', 'SCT', 183),
    ('Wales', 'WLS', 183),
    ('Northern Ireland', 'NIR', 183),
    ('Abu Dhabi', 'AD', 182),
    ('Dubai', 'DU', 182),
    ('Sharjah', 'SH', 182),
    ('Ajman', 'AJ', 182),
    ('Umm Al-Quwain', 'UQ', 182),
    ('Fujairah', 'FU', 182),
    ('Ras Al Khaimah', 'RK', 182),
    ('Alberta', 'AB', 32),
    ('British Columbia', 'BC', 32),
    ('Manitoba', 'MB', 32),
    ('New Brunswick', 'NB', 32),
    ('Newfoundland and Labrador', 'NL', 32),
    ('Nova Scotia', 'NS', 32),
    ('Ontario', 'ON', 32),
    ('Prince Edward Island', 'PE', 32),
    ('Quebec', 'QC', 32),
    ('Saskatchewan', 'SK', 32),
    ('Northwest Territories', 'NT', 32),
    ('Nunavut', 'NU', 32),
    ('Yukon', 'YT', 32),
    ('Auvergne-Rhône-Alpes', 'ARA', 60),
    ('Bourgogne-Franche-Comté', 'BFC', 60),
    ('Brittany', 'BRE', 60),
    ('Centre-Val de Loire', 'CVL', 60),
    ('Corsica', 'COR', 60),
    ('Grand Est', 'GES', 60),
    ('Hauts-de-France', 'HDF', 60),
    ('Île-de-France', 'IDF', 60),
    ('Normandy', 'NOR', 60),
    ('Nouvelle-Aquitaine', 'NAQ', 60),
    ('Occitanie', 'OCC', 60),
    ('Pays de la Loire', 'PDL', 60),
    ('Provence-Alpes-Côte d-Azur', 'PAC', 60),
    ('Overseas', 'OMR', 60),
    ('Baden-Württemberg', 'BW', 64),
    ('Bavaria', 'BY', 64),
    ('Berlin', 'BE', 64),
    ('Brandenburg', 'BB', 64),
    ('Bremen', 'HB', 64),
    ('Hamburg', 'HH', 64),
    ('Hesse', 'HE', 64),
    ('Lower Saxony', 'NI', 64),
    ('Mecklenburg-Western Pomerania', 'MV', 64),
    ('North Rhine-Westphalia', 'NW', 64),
    ('Rhineland-Palatinate', 'RP', 64),
    ('Saarland', 'SL', 64),
    ('Saxony', 'SN', 64),
    ('Saxony-Anhalt', 'ST', 64),
    ('Schleswig-Holstein', 'SH', 64),
    ('Thuringia', 'TH', 64);

-- Insert default cities
INSERT INTO city (name, state_id) VALUES
    ('Chennai', 116),
    ('Coimbatore', 116),
    ('Madurai', 116),
    ('Tiruchirappalli', 116),
    ('Salem', 116),
    ('Tirunelveli', 116),
    ('Erode', 116),
    ('Vellore', 116),
    ('Thoothukudi', 116),
    ('Dindigul', 116),
    ('Thanjavur', 116),
    ('Ranipet', 116),
    ('Sivakasi', 116),
    ('Karur', 116),
    ('Udhagamandalam (Ooty)', 116),
    ('Kanchipuram', 116),
    ('Nagapattinam', 116),
    ('Cuddalore', 116),
    ('Tiruvannamalai', 116),
    ('Nagercoil', 116),
    ('Thiruvananthapuram', 105),
    ('Kochi', 105),
    ('Kozhikode', 105),
    ('Kollam', 105),
    ('Thrissur', 105),
    ('Alappuzha', 105),
    ('Palakkad', 105),
    ('Kannur', 105),
    ('Malappuram', 105),
    ('Kottayam', 105),
    ('Pathanamthitta', 105),
    ('Idukki', 105),
    ('Wayanad', 105),
    ('Kasargod', 105),
    ('Bengaluru', 104),
    ('Mysuru', 104),
    ('Mangaluru', 104),
    ('Hubballi-Dharwad', 104),
    ('Belagavi', 104),
    ('Kalaburagi', 104),
    ('Davangere', 104),
    ('Ballari', 104),
    ('Vijayapura', 104),
    ('Shivamogga', 104),
    ('Tumakuru', 104),
    ('Raichur', 104),
    ('Bidar', 104),
    ('Udupi', 104),
    ('Chikkamagaluru', 104),
    ('Hassan', 104),
    ('Bagalkot', 104),
    ('Dharwad', 104),
    ('Chitradurga', 104),
    ('Mandya', 104),
    ('Hassan', 104),
    ('Bagalkot', 104),
    ('Dharwad', 104),
    ('Visakhapatnam', 84),
    ('Vijayawada', 84),
    ('Guntur', 84),
    ('Nellore', 84),
    ('Kurnool', 84),
    ('Rajahmundry', 84),
    ('Tirupati', 84),
    ('Kadapa', 84),
    ('Anantapur', 84),
    ('Eluru', 84),
    ('Ongole', 84),
    ('Srikakulam', 84),
    ('Chittoor', 84),
    ('Vizianagaram', 84),
    ('Machilipatnam', 84),
    ('Proddatur', 84),
    ('Tenali', 84),
    ('Adoni', 84),
    ('Hindupur', 84),
    ('Bhimavaram', 84),
    ('Hyderabad', 117),
    ('Warangal', 117),
    ('Nizamabad', 117),
    ('Khammam', 117),
    ('Karimnagar', 117),
    ('Ramagundam', 117),
    ('Mahbubnagar', 117),
    ('Adilabad', 117),
    ('Suryapet', 117),
    ('Miryalaguda', 117),
    ('Jagtial', 117),
    ('Mancherial', 117),
    ('Kothagudem', 117),
    ('Siddipet', 117),
    ('Nalgonda', 117),
    ('Wanaparthy', 117),
    ('Bhadrachalam', 117),
    ('Zaheerabad', 117),
    ('Vikarabad', 117),
    ('Medak', 117),
    ('Mumbai', 107),
    ('Pune', 107),
    ('Nagpur', 107),
    ('Thane', 107),
    ('Nashik', 107),
    ('Aurangabad', 107),
    ('Solapur', 107),
    ('Amravati', 107),
    ('Kolhapur', 107),
    ('Sangli', 107),
    ('Jalgaon', 107),
    ('Akola', 107),
    ('Latur', 107),
    ('Dhule', 107),
    ('Ahmednagar', 107),
    ('Chandrapur', 107),
    ('Parbhani', 107),
    ('Nanded', 107),
    ('Beed', 107),
    ('Ratnagiri', 107),
    ('Kolkata', 121),
    ('Howrah', 121),
    ('Durgapur', 121),
    ('Asansol', 121),
    ('Siliguri', 121),
    ('Darjeeling', 121),
    ('Bardhaman', 121),
    ('Kharagpur', 121),
    ('Malda', 121),
    ('Jalpaiguri', 121),
    ('Haldia', 121),
    ('Barrackpore', 121),
    ('Baharampur', 121),
    ('Cooch Behar', 121),
    ('Alipurduar', 121),
    ('Balurghat', 121),
    ('Bankura', 121),
    ('Purulia', 121),
    ('Medinipur', 121),
    ('Krishnanagar', 121),
    ('Lucknow', 119),
    ('Kanpur', 119),
    ('Varanasi', 119),
    ('Agra', 119),
    ('Meerut', 119),
    ('Prayagraj', 119),
    ('Ghaziabad', 119),
    ('Noida', 119),
    ('Aligarh', 119),
    ('Moradabad', 119),
    ('Bareilly', 119),
    ('Saharanpur', 119),
    ('Gorakhpur', 119),
    ('Jhansi', 119),
    ('Firozabad', 119),
    ('Mathura', 119),
    ('Shahjahanpur', 119),
    ('Rampur', 119),
    ('Muzaffarnagar', 119),
    ('Faizabad (Ayodhya)', 119),
    ('Ahmedabad', 100),
    ('Surat', 100),
    ('Vadodara', 100),
    ('Rajkot', 100),
    ('Bhavnagar', 100),
    ('Jamnagar', 100),
    ('Junagadh', 100),
    ('Gandhinagar', 100),
    ('Anand', 100),
    ('Morbi', 100),
    ('Nadiad', 100),
    ('Porbandar', 100),
    ('Mehsana', 100),
    ('Bhuj', 100),
    ('Navsari', 100),
    ('Vapi', 100),
    ('Palanpur', 100),
    ('Valsad', 100),
    ('Dahod', 100),
    ('Godhra', 100),
    ('New Delhi', 125),
    ('Puducherry', 129),
    ('Amritsar', 113),
    ('Ludhiana', 113),
    ('Jalandhar', 113),
    ('Patiala', 113),
    ('Bathinda', 113),
    ('Mohali', 113),
    ('Hoshiarpur', 113),
    ('Pathankot', 113),
    ('Moga', 113),
    ('Phagwara', 113),
    ('Barnala', 113),
    ('Firozpur', 113),
    ('Zirakpur', 113),
    ('Malerkotla', 113),
    ('Kapurthala', 113),
    ('Faridkot', 113),
    ('Sangrur', 113),
    ('Tarn Taran', 113),
    ('Rajpura', 113),
    ('Khanna', 113),
    ('Chandigarh', 123),
    ('Bhubaneswar', 112),
    ('Cuttack', 112),
    ('Rourkela', 112),
    ('Berhampur', 112),
    ('Sambalpur', 112),
    ('Puri', 112),
    ('Balasore', 112),
    ('Baripada', 112),
    ('Bhadrak', 112),
    ('Jharsuguda', 112),
    ('Jeypore', 112),
    ('Angul', 112),
    ('Dhenkanal', 112),
    ('Paradeep', 112),
    ('Rayagada', 112),
    ('Koraput', 112),
    ('Bargarh', 112),
    ('Kendujhar', 112),
    ('Nabarangpur', 112),
    ('Phulbani', 112);


