start:
	@echo " Building and running application through Docker..."
	@bash bin/docker-start.sh & \
	SERVICE_PID=$$!; \
	( \
		secs=140; \
		while [ $$secs -gt 0 ]; do \
			printf "\r %3s seconds remaining" $$secs; \
			sleep 1; \
			secs=$$((secs - 1)); \
		done; \
		printf "\r Done! You are ready to go.                          \n"; \
	) & \
	TIMER_PID=$$!; \
	wait $$SERVICE_PID; \
	wait $$TIMER_PID

stop:
	@echo "Stoping docker-compose..."
	cd docker && docker-compose down

pull-artifacts:
	@bash bin/pull-artifacts.sh

dev:
	@echo "Starting locally all applications..."
	@bash bin/start-webapp.sh & \
	PID1=$$!; \
	bash bin/start-product-svc.sh & \
	PID2=$$!; \
	echo "WebApp PID: $$PID1"; \
	echo "ProductSvc PID: $$PID2"; \
	trap '\
		echo "\nCtrl+C detected. Stopping..."; \
		kill -TERM $$PID1 $$PID2 2>/dev/null; \
		echo "Stopping docker-compose..."; \
		(cd docker && docker-compose down); \
		exit 0' SIGINT SIGTERM; \
	wait

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