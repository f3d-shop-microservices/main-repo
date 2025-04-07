start:
	@echo "Building and running application through Docker..."
	@bash bin/docker-start.sh & \
	SERVICE_PID=$$!; \
	( bash bin/wait-for-health.sh ) & \
	WAIT_PID=$$!; \
	wait $$SERVICE_PID; \
	wait $$WAIT_PID

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

update-submodules:
	git submodule update --remote --merge
	git add .
	git commit -m "Update all submodules to latest commits"
	git push

init-submodules:
	git submodule update --init --recursive

submodule-status:
	git submodule status