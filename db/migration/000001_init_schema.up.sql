CREATE TABLE "accounts" (
  "id" bigserial PRIMARY KEY,
  "owner" varchar NOT NULL,
  "balance" int NOT NULL,
  "currency" varchar NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT 'now()'
);

CREATE TABLE "entries" (
  "id" bigserial PRIMARY KEY,
  "account_id" bigInt NOT NULL,
  "amount" bigInt NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT 'now()'
);

CREATE TABLE "transfer" (
  "id" bigserial PRIMARY KEY,
  "from_account_id" bigint NOT NULL,
  "to_account_id" bigint NOT NULL,
  "amount" bigInt NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT 'now()'
);

CREATE INDEX ON "accounts" ("owner");

CREATE INDEX ON "entries" ("account_id");

CREATE INDEX ON "transfer" ("from_account_id");

CREATE INDEX ON "transfer" ("to_account_id");

CREATE INDEX ON "transfer" ("from_account_id", "to_account_id");

COMMENT ON COLUMN "entries"."amount" IS 'can be negative or can be positive';

ALTER TABLE "entries" ADD FOREIGN KEY ("account_id") REFERENCES "accounts" ("id");

ALTER TABLE "transfer" ADD FOREIGN KEY ("from_account_id") REFERENCES "accounts" ("id");

ALTER TABLE "transfer" ADD FOREIGN KEY ("to_account_id") REFERENCES "accounts" ("id");
