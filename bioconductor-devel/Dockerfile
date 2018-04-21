# based on https://github.com/rocker-org/rocker/blob/master/r-devel/Dockerfile
FROM debian:buster
RUN apt-get autoclean
RUN apt-get update
# general stuff
RUN apt-get -y install vim git wget unzip net-tools
# R (also gets many dependencies)
# RUN apt-get -y install r-base-dev r-base
# other depedencies
RUN apt-get -y install fonts-texgyre bash-completion bison debhelper default-jdk g++ gcc gdb gfortran groff-base libblas-dev libbz2-dev libcairo2-dev libcurl4-openssl-dev libjpeg-dev liblapack-dev liblzma-dev libncurses5-dev libpango1.0-dev libpcre3-dev libpng-dev libreadline-dev libtiff5-dev libx11-dev libxt-dev mpack subversion tcl8.6-dev texinfo texlive-base texlive-extra-utils texlive-fonts-extra texlive-fonts-recommended texlive-generic-recommended texlive-latex-base texlive-latex-extra texlive-latex-recommended tk8.6-dev x11proto-core-dev xauth xdg-utils xfonts-base xvfb zlib1g-dev
## Check out R-devel
RUN cd /tmp; wget https://stat.ethz.ch/R/daily/R-devel.tar.gz; tar -xzf R-devel.tar.gz
#&& svn co https://svn.r-project.org/R/trunk R-devel
## Build and install
RUN cd /tmp/R-devel \
	&& R_PAPERSIZE=letter \
		R_BATCHSAVE="--no-save --no-restore" \
		R_BROWSER=xdg-open \
		PAGER=/usr/bin/pager \
		PERL=/usr/bin/perl \
		R_UNZIPCMD=/usr/bin/unzip \
		R_ZIPCMD=/usr/bin/zip \
		R_PRINTCMD=/usr/bin/lpr \
		LIBnn=lib \
		AWK=/usr/bin/awk \
		CFLAGS=$(R CMD config CFLAGS) \
		CXXFLAGS=$(R CMD config CXXFLAGS) \
	./configure --enable-R-shlib \
               --without-blas \
               --without-lapack \
               --with-readline \
               --without-recommended-packages \
               --program-suffix=dev \
	&& make \
	&& make install \
	&& rm -rf /tmp/R-devel
## Install dependencies
#RUN Rscript -e "install.packages('data.table')"
#RUN Rscript -e "install.packages('ggplot2')"
#RUN Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite("bsseq")'
#RUN Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite("")'
#RUN Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite("YAPSA")'

