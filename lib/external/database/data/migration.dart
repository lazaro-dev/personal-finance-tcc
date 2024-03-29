class Migration {
  static final List<String> tables = [
    '''CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        name TEXT, 
        username TEXT, 
        email TEXT, 
        phone TEXT, 
        image TEXT, 
        password TEXT
       )''',
    '''CREATE TABLE account_types (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        name TEXT, 
        slug TEXT
       )''',
    '''CREATE TABLE accounts (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        name TEXT, 
        balance DECIMAL(10,2), 
        institution_id INTEGER, 
        account_type_id INTEGER, 
        FOREIGN KEY(institution_id) REFERENCES account_types(id),
        FOREIGN KEY(account_type_id) REFERENCES account_types(id)
       )''',
    '''CREATE TABLE institutions (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        name TEXT, 
        image TEXT
       )''',
    '''CREATE TABLE transactions (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        observation TEXT, 
        image TEXT,
        from_account_id INTEGER, 
        to_account_id INTEGER,
        FOREIGN KEY(from_account_id) REFERENCES accounts(id),
        FOREIGN KEY(to_account_id) REFERENCES accounts(id)
       )''',
  ];
}
