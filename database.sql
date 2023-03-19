create TABLE "user" (
    id SERIAL PRIMARY KEY,
    username varchar(20),
    first_name varchar(20),
    last_name varchar(20),
    password varchar(20)
);

create TABLE "error" (
    number SERIAL PRIMARY KEY,
    createdat timestamp,
    small_text varchar(20),
    description varchar(200),
    user_id INTEGER,
    FOREIGN KEY(user_id) REFERENCES "user" (id)
);

create TABLE "history" (
    createdat timestamp,
    action varchar(20),
    comment varchar(200),
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES "user" (id)
);

