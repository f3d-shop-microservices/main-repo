init:
	@bash bin/init-project.sh

start:
	@echo "Building and running application through Docker..."
	@bash bin/docker-start.sh "$(PROD)"

stop:
	@echo "Stoping docker-compose..."
	cd docker && docker-compose down

pull-artifacts:
	@bash bin/pull-artifacts.sh

commit-submodule:
	@read -p "Submodule path (e.g. services/product): " path; \
	read -p "Commit message: " msg; \
	cd $$path && git add . && git commit -m "$$msg" && git push && \
	cd - && git add $$path && git commit -m "Update submodule $$path" && git push

submodule-status:
	git submodule status

#taskkill /F /IM symfony.exe /T