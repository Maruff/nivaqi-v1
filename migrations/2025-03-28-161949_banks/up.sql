-- Your SQL goes here

CREATE TABLE banks (
    bank_id SERIAL PRIMARY KEY,
    bank_name VARCHAR(100) NOT NULL,
    bank_code VARCHAR(20) UNIQUE NOT NULL,
    address TEXT,
    country_id INT,  
    phone_number VARCHAR(15),
    email VARCHAR(100),
    website VARCHAR(100),
    active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (country_id) REFERENCES country(id)
);

CREATE TABLE bank_accounts (
    id SERIAL PRIMARY KEY,
    number VARCHAR(50) UNIQUE NOT NULL,
    bank_id INT NOT NULL,
    account_type VARCHAR(50),
    balance DECIMAL(15, 2) DEFAULT 0.00,
    currency VARCHAR(10) DEFAULT 'USD',
    owner_type VARCHAR(10) CHECK (owner_type IN ('Entity', 'Partner')),
    owner_id INT NOT NULL,
    active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (bank_id) REFERENCES banks(bank_id),
    CONSTRAINT fk_entity FOREIGN KEY (owner_id) REFERENCES entities(id),
    CONSTRAINT fk_partner FOREIGN KEY (owner_id) REFERENCES partner(id)
);

CREATE TABLE exchange_rate (
    id SERIAL PRIMARY KEY,
    base_currency_id INT NOT NULL,
    target_currency_id INT NOT NULL,
    rate DECIMAL(15, 6) NOT NULL,
    effective_date DATE NOT NULL,
    active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (base_currency_id) REFERENCES currency(id),
    FOREIGN KEY (target_currency_id) REFERENCES currency(id)
);

-- Insert data into banks table
INSERT INTO banks (bank_name, bank_code, address, country_id, phone_number, email, website)
VALUES
    -- Indian Banks
    ('State Bank of India', 'SBI', 'Mumbai, India', 76, '+91-22-22029456', 'contact@sbi.co.in', 'https://www.onlinesbi.com'),
    ('HDFC Bank', 'HDFC', 'Mumbai, India', 76, '+91-22-61606161', 'support@hdfcbank.com', 'https://www.hdfcbank.com'),
    ('ICICI Bank', 'ICICI', 'Mumbai, India', 76, '+91-22-33667777', 'care@icicibank.com', 'https://www.icicibank.com'),
    ('Axis Bank', 'AXIS', 'Mumbai, India', 76, '+91-22-24252525', 'customer.service@axisbank.com', 'https://www.axisbank.com'),
    ('Punjab National Bank', 'PNB', 'New Delhi, India', 76, '+91-11-23718172', 'care@pnb.co.in', 'https://www.pnbindia.in'),
    ('Bank of Baroda', 'BOB', 'Vadodara, India', 76, '+91-79-26508000', 'info@bankofbaroda.com', 'https://www.bankofbaroda.in'),
    ('Canara Bank', 'CANARA', 'Bengaluru, India', 76, '+91-80-22221500', 'canarabank@canarabank.com', 'https://www.canarabank.com'),
    ('Union Bank of India', 'UBI', 'Mumbai, India', 76, '+91-22-22892000', 'customercare@unionbankofindia.com', 'https://www.unionbankofindia.co.in'),
    ('Kotak Mahindra Bank', 'KOTAK', 'Mumbai, India', 76, '+91-22-66006022', 'service.bank@kotak.com', 'https://www.kotak.com'),
    ('IndusInd Bank', 'INDUSIND', 'Mumbai, India', 76, '+91-22-44066666', 'reachus@indusind.com', 'https://www.indusind.com'),
    ('IDBI Bank', 'IDBI', 'Mumbai, India', 76, '+91-22-66553355', 'customercare@idbi.co.in', 'https://www.idbibank.in'),
    ('Yes Bank', 'YES', 'Mumbai, India', 76, '+91-22-33669000', 'yestouch@yesbank.in', 'https://www.yesbank.in'),
    ('Indian Bank', 'INDIAN', 'Chennai, India', 76, '+91-44-28134300', 'indianbank@indianbank.co.in', 'https://www.indianbank.in'),
    ('Central Bank of India', 'CBI', 'Mumbai, India', 76, '+91-22-22612008', 'info@centralbank.co.in', 'https://www.centralbankofindia.co.in'),
    ('Bank of India', 'BOI', 'Mumbai, India', 76, '+91-22-66684444', 'customercare@bankofindia.co.in', 'https://www.bankofindia.co.in'),
    ('UCO Bank', 'UCO', 'Kolkata, India', 76, '+91-33-44557200', 'ucobank@ucobank.co.in', 'https://www.ucobank.com'),
    ('IDFC First Bank', 'IDFC', 'Mumbai, India', 76, '+91-22-71321500', 'bank@idfcfirstbank.com', 'https://www.idfcfirstbank.com'),
    ('Federal Bank', 'FEDERAL', 'Aluva, India', 76, '+91-484-2630994', 'contact@federalbank.co.in', 'https://www.federalbank.co.in'),
    ('South Indian Bank', 'SIB', 'Thrissur, India', 76, '+91-487-2420020', 'sib@sib.co.in', 'https://www.southindianbank.com'),
    ('Karur Vysya Bank', 'KVB', 'Karur, India', 76, '+91-4324-269000', 'kvb@kvbmail.com', 'https://www.kvb.co.in'),

    -- Banks in Qatar
    ('Qatar National Bank', 'QNB', 'Doha, Qatar', 139, '+974-44407777', 'info@qnb.com', 'https://www.qnb.com'),
    ('Doha Bank', 'DOHA', 'Doha, Qatar', 139, '+974-44456000', 'info@dohabank.com', 'https://www.dohabank.com'),
    ('Commercial Bank of Qatar', 'CBQ', 'Doha, Qatar', 139, '+974-44490000', 'customercare@cbq.qa', 'https://www.cbq.qa'),
    ('Masraf Al Rayan', 'MAR', 'Doha, Qatar', 139, '+974-44253333', 'info@alrayan.com', 'https://www.alrayan.com'),
    ('Al Khaliji Bank', 'ALKHALIJI', 'Doha, Qatar', 139, '+974-44940000', 'info@alkhaliji.com', 'https://www.alkhaliji.com'),

    -- Banks in UAE
    ('Emirates NBD', 'ENBD', 'Dubai, UAE', 182, '+971-600-540000', 'info@emiratesnbd.com', 'https://www.emiratesnbd.com'),
    ('Abu Dhabi Commercial Bank', 'ADCB', 'Abu Dhabi, UAE', 182, '+971-2-6210090', 'contact@adcb.com', 'https://www.adcb.com'),
    ('Dubai Islamic Bank', 'DIB', 'Dubai, UAE', 182, '+971-4-6092222', 'info@dib.ae', 'https://www.dib.ae'),
    ('Mashreq Bank', 'MASHREQ', 'Dubai, UAE', 182, '+971-4-4244444', 'info@mashreqbank.com', 'https://www.mashreqbank.com'),
    ('First Abu Dhabi Bank', 'FAB', 'Abu Dhabi, UAE', 182, '+971-2-6811511', 'info@bankfab.com', 'https://www.bankfab.com'),

    -- Banks in Other Arabic Countries
    ('National Bank of Kuwait', 'NBK', 'Kuwait City, Kuwait', 89, '+965-22422011', 'info@nbk.com', 'https://www.nbk.com'),
    ('Al Rajhi Bank', 'RAJHI', 'Riyadh, Saudi Arabia', 149, '+966-11-2116000', 'info@alrajhibank.com.sa', 'https://www.alrajhibank.com.sa'),
    ('Saudi National Bank', 'SNB', 'Jeddah, Saudi Arabia', 149, '+966-12-6464000', 'info@snb.com', 'https://www.snb.com'),
    ('Banque Misr', 'BM', 'Cairo, Egypt', 51, '+20-2-19888', 'info@banquemisr.com', 'https://www.banquemisr.com'),
    ('National Bank of Egypt', 'NBE', 'Cairo, Egypt', 51, '+20-2-19623', 'info@nbe.com.eg', 'https://www.nbe.com.eg'),
    -- ('Bank of Palestine', 'BOP', 'Ramallah, Palestine', 7, '+970-2-2942000', 'info@bankofpalestine.com', 'https://www.bankofpalestine.com'),
    ('Arab Bank', 'ARAB', 'Amman, Jordan', 85, '+962-6-4600900', 'info@arabbank.com', 'https://www.arabbank.com'),
    ('Kuwait Finance House', 'KFH', 'Kuwait City, Kuwait', 89, '+965-1803333', 'info@kfh.com', 'https://www.kfh.com'),
    -- ('Quds Bank', 'QUDS', 'Ramallah, Palestine', 7, '+970-2-2972000', 'info@qudsbank.ps', 'https://www.qudsbank.ps'),
    ('Bank Audi', 'AUDI', 'Beirut, Lebanon', 93, '+961-1-977477', 'info@bankaudi.com', 'https://www.bankaudi.com'),
    
    -- International Banks
    ('Bank of America', 'BOA', 'Charlotte, USA', 184, '+1-800-432-1000', 'support@bankofamerica.com', 'https://www.bankofamerica.com'),
    ('HSBC', 'HSBC', 'London, UK', 183, '+44-20-79918888', 'info@hsbc.co.uk', 'https://www.hsbc.co.uk'),
    ('Deutsche Bank', 'DB', 'Frankfurt, Germany', 64, '+49-69-91010000', 'contact@db.com', 'https://www.db.com'),
    ('Standard Chartered', 'SC', 'London, UK', 183, '+44-20-78858888', 'info@sc.com', 'https://www.sc.com'),
    ('JPMorgan Chase', 'JPMC', 'New York, USA', 184, '+1-212-270-6000', 'contact@jpmorganchase.com', 'https://www.jpmorganchase.com'),
    ('Citibank', 'CITI', 'New York, USA', 184, '+1-800-374-9700', 'support@citi.com', 'https://www.citi.com'),
    ('Wells Fargo', 'WF', 'San Francisco, USA', 184, '+1-800-869-3557', 'info@wellsfargo.com', 'https://www.wellsfargo.com'),
    ('Barclays', 'BARC', 'London, UK', 183, '+44-20-71168000', 'info@barclays.com', 'https://www.barclays.co.uk'),
    ('BNP Paribas', 'BNP', 'Paris, France', 60, '+33-1-40142000', 'contact@bnpparibas.com', 'https://www.bnpparibas.com'),
    ('UBS', 'UBS', 'Zurich, Switzerland', 167, '+41-44-2341111', 'info@ubs.com', 'https://www.ubs.com'),
    ('Credit Suisse', 'CS', 'Zurich, Switzerland', 167, '+41-44-3331111', 'info@credit-suisse.com', 'https://www.credit-suisse.com'),
    ('Royal Bank of Canada', 'RBC', 'Toronto, Canada', 32, '+1-800-769-2511', 'info@rbc.com', 'https://www.rbc.com'),
    ('Toronto-Dominion Bank', 'TD', 'Toronto, Canada', 32, '+1-866-222-3456', 'info@td.com', 'https://www.td.com'),
    ('Banco Santander', 'SAN', 'Madrid, Spain', 162, '+34-91-2890000', 'info@santander.com', 'https://www.santander.com'),
    ('Mizuho Bank', 'MIZUHO', 'Tokyo, Japan', 84, '+81-3-32141111', 'info@mizuho.com', 'https://www.mizuhobank.com'),
    ('Sumitomo Mitsui Banking Corporation', 'SMBC', 'Tokyo, Japan', 84, '+81-3-32821111', 'info@smbc.co.jp', 'https://www.smbc.co.jp'),
    ('Bank of China', 'BOC', 'Beijing, China', 36, '+86-10-66596688', 'info@boc.cn', 'https://www.boc.cn'),
    ('Industrial and Commercial Bank of China', 'ICBC', 'Beijing, China', 36, '+86-10-66108688', 'info@icbc.com.cn', 'https://www.icbc.com.cn'),
    ('Australia and New Zealand Banking Group', 'ANZ', 'Melbourne, Australia', 10, '+61-3-92735555', 'info@anz.com', 'https://www.anz.com'),
    ('Commonwealth Bank', 'CBA', 'Sydney, Australia', 10, '+61-2-93784444', 'info@cba.com.au', 'https://www.commbank.com.au'),
    ('Banco Bradesco', 'BRADESCO', 'Osasco, Brazil', 24, '+55-11-36840000', 'info@bradesco.com.br', 'https://www.bradesco.com.br'),
    ('Itau Unibanco', 'ITAU', 'Sao Paulo, Brazil', 24, '+55-11-27948000', 'info@itau.com.br', 'https://www.itau.com.br'),
    ('Scotiabank', 'SCOTIA', 'Toronto, Canada', 32, '+1-800-472-6842', 'info@scotiabank.com', 'https://www.scotiabank.com'),
    ('Nordea Bank', 'NORDEA', 'Stockholm, Sweden', 166, '+46-8-6147000', 'info@nordea.com', 'https://www.nordea.com'),
    ('Danske Bank', 'DANSKE', 'Copenhagen, Denmark', 46, '+45-70-123456', 'info@danskebank.com', 'https://www.danskebank.com'),
    ('ING Group', 'ING', 'Amsterdam, Netherlands', 121, '+31-20-5639111', 'info@ing.com', 'https://www.ing.com'),
    ('Rabobank', 'RABO', 'Utrecht, Netherlands', 121, '+31-30-2160000', 'info@rabobank.com', 'https://www.rabobank.com');

