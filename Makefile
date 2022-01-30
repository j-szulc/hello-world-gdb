default:
	docker kill hello_gdb || true
	make build && make run
run:
	docker run -it --platform linux/amd64 --rm --privileged -v `pwd`/shared:/shared --name hello_gdb -p 127.0.0.1:5550:5550 -- hello-world-gdb
build:
	docker build -t hello-world-gdb --platform linux/amd64 .