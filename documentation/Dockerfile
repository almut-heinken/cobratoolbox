FROM ubuntu:18.04
RUN apt update; apt install -y git vim python-pip
RUN mkdir /repos; cd /repos; git clone https://github.com/opencobra/cobratoolbox
COPY requirements.txt .
RUN pip install -r requirements.txt
CMD cd /repos/cobratoolbox; \
	echo "Checking out latest from opencobra/cobratoolbox master branch..."; \
	git pull origin master; \
	cd ./docs; \
	echo "Building docs..."; \
	make html; \
	output_tar=cobratoolbox_doc_`date +%Y%m%d-%H%M`.tar.gz; \
	echo "Copying build docs to output folder as file ${output_tar} ..."; \
	tar czf /output/${output_tar} ./build
