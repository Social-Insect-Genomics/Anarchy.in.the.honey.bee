bwa index -a bwtsw am45new.fasta
samtools faidx am45new.fasta
java -jar /usr/local/picard/1.119/CreateSequenceDictionary.jar R=am45new.fasta O=am45new.dict

bwa mem -M -t 1 am45new.fasta An_09_CAE85ANXX_CAGATC_L007_R1.fastq.gz An_09_CAE85ANXX_CAGATC_L007_R1.fastq.gz| samtools view -bSho 9_woRG.bam -
bwa mem -M -t 1 am45new.fasta AI21_CAE85ANXX_TGACCA_L007_R1.fastq.gz AI21_CAE85ANXX_TGACCA_L007_R2.fastq.gz | samtools view -bSho 21_woRG.bam -
bwa mem -M -t 1 am45new.fasta Y33_CAE85ANXX_GCCAAT_L007_R1.fastq.gz Y33_CAE85ANXX_GCCAAT_L007_R2.fastq.gz | samtools view -bSho 33_woRG.bam -
bwa mem -M -t 1 am45new.fasta AI47_CAE85ANXX_ACAGTG_L007_R1.fastq.gz AI47_CAE85ANXX_ACAGTG_L007_R1.fastq.gz | samtools view -bSho 47_woRG.bam -
bwa mem -M -t 1 am45new.fasta AI51_CAE85ANXX_ACTTGA_L007_R1.fastq.gz AI51_CAE85ANXX_ACTTGA_L007_R2.fastq.gz | samtools view -bSho 51_woRG.bam -
bwa mem -M -t 1 am45new.fasta of_pool_1_CAE85ANXX_CGATGT_L006_R1.fastq.gz of_pool_1_CAE85ANXX_CGATGT_L006_R2.fastq.gz | samtools view -bSho Pool1_woRG.bam -
bwa mem -M -t 1 am45new.fasta of_pool_2_CAE85ANXX_TTAGGC_L006_R1.fastq.gz of_pool_2_CAE85ANXX_TTAGGC_L006_R2.fastq.gz | samtools view -bSho Pool2_woRG.bam -

samtools sort 9_woRG.bam 9_woRG.bam_sort
samtools sort 21_woRG.bam 21_woRG.bam_sort
samtools sort 33_woRG.bam 33_woRG.bam_sort
samtools sort 47_woRG.bam 47_woRG.bam_sort
samtools sort 51_woRG.bam 51_woRG.bam_sort
samtools sort Pool1_woRG.bam Pool1_woRG.bam_sort
samtools sort Pool2_woRG.bam Pool2_woRG.bam_sort

java -jar /usr/local/picard/1.119/AddOrReplaceReadGroups.jar I=9_woRG.bam_sort.bam O=9_woRG.bam_sort_add_rg.bam RGID=9 RGPL=illumina RGSM=9 RGLB=lib1 RGPU=unit1
java -jar /usr/local/picard/1.119/AddOrReplaceReadGroups.jar I=21_woRG.bam_sort.bam O=21_woRG.bam_sort_add_rg.bam RGID=21 RGPL=illumina RGSM=21 RGLB=lib1 RGPU=unit1
java -jar /usr/local/picard/1.119/AddOrReplaceReadGroups.jar I=33_woRG.bam_sort.bam O=33_woRG.bam_sort_add_rg.bam RGID=33 RGPL=illumina RGSM=33 RGLB=lib1 RGPU=unit1
java -jar /usr/local/picard/1.119/AddOrReplaceReadGroups.jar I=47_woRG.bam_sort.bam O=47_woRG.bam_sort_add_rg.bam RGID=47 RGPL=illumina RGSM=47 RGLB=lib1 RGPU=unit1
java -jar /usr/local/picard/1.119/AddOrReplaceReadGroups.jar I=51_woRG.bam_sort.bam O=51_woRG.bam_sort_add_rg.bam RGID=51 RGPL=illumina RGSM=51 RGLB=lib1 RGPU=unit1
java -jar /usr/local/picard/1.119/AddOrReplaceReadGroups.jar I=Pool1_woRG.bam_sort.bam O=Pool1_woRG.bam_sort_add_rg.bam RGID=Pool2_anarchy RGPL=illumina RGSM=1 RGLB=lib1 RGPU=unit1
java -jar /usr/local/picard/1.119/AddOrReplaceReadGroups.jar I=Pool2_woRG.bam_sort.bam O=Pool2_woRG.bam_sort_add_rg.bam RGID=Pool2_anarchy RGPL=illumina RGSM=2 RGLB=lib1 RGPU=unit1

java -jar /usr/local/picard/1.119/MarkDuplicates.jar I=9_woRG.bam_sort_add_rg.bam O=9_woRG.bam_sort_add_rg_markdup.bam METRICS_FILE=9_woRG.bam_sort_add_rg_markdup.txt
java -jar /usr/local/picard/1.119/MarkDuplicates.jar I=21_woRG.bam_sort_add_rg.bam O=21_woRG.bam_sort_add_rg_markdup.bam METRICS_FILE=21_woRG.bam_sort_add_rg_markdup.txt
java -jar /usr/local/picard/1.119/MarkDuplicates.jar I=33_woRG.bam_sort_add_rg.bam O=33_woRG.bam_sort_add_rg_markdup.bam METRICS_FILE=33_woRG.bam_sort_add_rg_markdup.txt
java -jar /usr/local/picard/1.119/MarkDuplicates.jar I=47_woRG.bam_sort_add_rg.bam O=47_woRG.bam_sort_add_rg_markdup.bam METRICS_FILE=47_woRG.bam_sort_add_rg_markdup.txt
java -jar /usr/local/picard/1.119/MarkDuplicates.jar I=51_woRG.bam_sort_add_rg.bam O=21_woRG.bam_sort_add_rg_markdup.bam METRICS_FILE=51_woRG.bam_sort_add_rg_markdup.txt
java -jar /usr/local/picard/1.119/MarkDuplicates.jar I=Pool1_woRG.bam_sort_add_rg.bam O=Pool1_woRG.bam_sort_add_rg_markdup.bam METRICS_FILE=Pool1_woRG.bam_sort_add_rg_markdup.txt
java -jar /usr/local/picard/1.119/MarkDuplicates.jar I=Pool2_woRG.bam_sort_add_rg.bam O=Pool2_woRG.bam_sort_add_rg_markdup.bam METRICS_FILE=Pool2_woRG.bam_sort_add_rg_markdup.txt

samtools index 9_woRG.bam_sort_add_rg_markdup.bam
samtools index 21_woRG.bam_sort_add_rg_markdup.bam
samtools index 33_woRG.bam_sort_add_rg_markdup.bam
samtools index 47_woRG.bam_sort_add_rg_markdup.bam
samtools index 51_woRG.bam_sort_add_rg_markdup.bam
samtools index Pool1_woRG.bam_sort_add_rg_markdup.bam
samtools index Pool2_woRG.bam_sort_add_rg_markdup.bam

freebayes -f am45new.fasta -p 1 -m 40 9_woRG.bam_sort_add_rg_markdup.bam > 9_var_m40.vcf
freebayes -f am45new.fasta -p 1 -m 40 21_woRG.bam_sort_add_rg_markdup.bam > 21_var_m40.vcf
freebayes -f am45new.fasta -p 2 -m 40 33_woRG.bam_sort_add_rg_markdup.bam > 33_var_m40.vcf
freebayes -f am45new.fasta -p 1 -m 40 47_woRG.bam_sort_add_rg_markdup.bam > 47_var_m40.vcf
freebayes -f am45new.fasta -p 1 -m 40 51_woRG.bam_sort_add_rg_markdup.bam > 51_var_m40.vcf
freebayes -f am45new.fasta -p 2 -m 40 Pool1_woRG.bam_sort_add_rg_markdup.bam > Pool1_var_m40.vcf
freebayes -f am45new.fasta -p 2 -m 40 Pool2_woRG.bam_sort_add_rg_markdup.bam > Pool2_var_m40.vcf
