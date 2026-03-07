IMAGE=rpi-image-gen-builder
WORK=$(PWD)/work
CACHE=$(PWD)/cache
SRC=$(PWD)/rpi-image-gen

build-image:
	docker build --platform linux/arm64 -f Dockerfile.builder -t $(IMAGE) .

shell:
	docker run --rm -it \
		--privileged \
		-v $(SRC):/workspace/rpi-image-gen \
		-v $(WORK):/workspace/rpi-image-gen/work \
		-v $(CACHE):/var/cache/apt \
		$(IMAGE)

build:
	mkdir -p work cache
	docker run --rm -it \
		--privileged \
		--platform linux/arm64 \
		-v $(SRC):/workspace/rpi-image-gen \
		-v $(WORK):/workspace/rpi-image-gen/work \
		-v $(CACHE):/var/cache/apt \
		-w /workspace/rpi-image-gen \
		$(IMAGE) \
		./rpi-image-gen build -c config/bookworm-minbase.yaml


# build:
# 	mkdir -p work cache
# 	docker run --rm -it \
# 		--privileged \
# 		-v /proc/sys/fs/binfmt_misc:/proc/sys/fs/binfmt_misc \
# 		-v $(PWD)/rpi-image-gen:/workspace/rpi-image-gen \
# 		-v $(PWD)/work:/workspace/rpi-image-gen/work \
# 		-v $(PWD)/cache:/var/cache/apt \
# 		-w /workspace/rpi-image-gen \
# 		rpi-image-gen-builder \
# 		./rpi-image-gen build -c config/bookworm-minbase.yaml

clean:
	rm -rf work/*
