FROM centos:latest
MAINTAINER Amir Shams <amir.shams84@gmail.com>
##############################################################
# Dockerfile Version:   1.0
# Software:             centos7
# Software Version:     7.0
# Software Website:     https://www.centos.org/
# Description:          Centos7
##############################################################

RUN yum -y update ;
RUN yum clean all ;
RUN yum install -y epel-release ;
RUN yum install -y ansible git gcc gcc-c++ make net-tools sudo which wget file patch libtool texinfo tar zip unzip bzip2 bzip2-devel ; 
RUN yum install -y openssl openssl-devel readline readline-devel sqlite-devel tk-devel zlib zlib-devel ncurses-devel python-pip mc ;
RUN yum install -y tbb psmisc python-devel ;
RUN yum clean all ;
##############################################################
# Software:             PIP INSTALL PACKAGES
# Software Version:     1.0
# Software Website:     -
# Description:          required javascript library
##############################################################

RUN pip install --upgrade pip
RUN pip install numpy
RUN pip install scipy
RUN pip install plotly
RUN pip install pandas
RUN pip install xlrd
RUN pip install openpyxl
RUN pip install xlwt
RUN pip install XlsxWriter
RUN pip install lxml
RUN pip install zip
RUN pip install biom-format
##############################################################
# Software:             Regular Directories
# Software Version:     1.0
# Software Website:     -
# Description:          required javascript library
##############################################################

RUN mkdir /INPUTDIR /EXECDIR /OUTPUTDIR /TESTDIR /INDEXDIR /ARCHIVEDIR
RUN chmod -R 0755 /INPUTDIR /EXECDIR /OUTPUTDIR /TESTDIR /INDEXDIR /ARCHIVEDIR
##############################################################
# Dockerfile Version:   1.0
# Software:             mothur
# Software Version:     1.39
# Software Website:     www.mothur.org
# Description:          mothur 
##############################################################
 
RUN wget https://github.com/mothur/mothur/releases/download/v1.39.5/Mothur.linux_64.zip -P /EXECDIR
RUN unzip /EXECDIR/Mothur.linux_64.zip -d /EXECDIR
RUN rm -rf /EXECDIR/Mothur.linux_64.zip /EXECDIR/__MACOSX
RUN chmod -R 0755 /EXECDIR/mothur
##############################################################
# Software:             MAFFT
# Software Version:     7.22
# Software Website:     -
# Description:          MAFFT
##############################################################

RUN wget http://mafft.cbrc.jp/alignment/software/mafft-7.222-linux.tgz -P /EXECDIR 
RUN tar zxvf /EXECDIR/mafft-7.222-linux.tgz -C /EXECDIR
RUN rm -rf /EXECDIR/mafft-7.222-linux.tgz
RUN chmod -R 0755 /EXECDIR
##############################################################
# Software:             SILVA_SEED
# Software Version:     128
# Software Website:     -
# Description:          silva_seed_128
##############################################################

RUN wget https://www.mothur.org/w/images/a/a4/Silva.seed_v128.tgz -P /INDEXDIR
RUN tar zxvf /INDEXDIR/Silva.seed_v128.tgz -C /INDEXDIR
RUN rm -rf /INDEXDIR/Silva.seed_v128.tgz
##############################################################
# Dockerfile Version:   1.0
# Software:             simply_16S
# Software Version:     1.0
# Software Website:     .
# Description:          python script 
##############################################################
RUN wget https://github.com/amirshams84/simply_16S/raw/master/simply_16S.pyc -O /simply_16S.pyc
RUN chmod -R 0755 /simply_16S.pyc
