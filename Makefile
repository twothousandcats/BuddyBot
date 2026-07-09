.PHONY: dev dev-d prod down clean logs ps
dev:    ; docker compose up --build
dev-d:  ; docker compose up --build -d
prod:   ; docker compose -f docker-compose.yml -f docker-compose.prod.yml up -d --build
down:   ; docker compose down
clean:  ; docker compose down -v
logs:   ; docker compose logs -f
ps:     ; docker compose ps