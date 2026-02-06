-- +goose Up
-- +goose StatementBegin
CREATE TABLE versions (
    id INTEGER PRIMARY KEY,
    version INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- +goose StatementEnd

-- +goose Down
DROP IF EXISTS TABLE versions;
