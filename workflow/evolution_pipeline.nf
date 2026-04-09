nextflow.enable.dsl=2

params.primary = "data/primary.bam"
params.relapse = "data/relapse.bam"
params.genome  = "data/ref.fa"
params.outdir  = "results"

process SOMATIC_CALLING {
    tag "GATK Mutect2"
    publishDir "${params.outdir}/vcf", mode: 'copy'

    input:
    path primary
    path relapse
    path ref

    output:
    path "somatic_final.vcf"

    script:
    """
    gatk Mutect2 -R ${ref} -I ${primary} -I ${relapse} -O somatic_final.vcf
    """
}

process CLONAL_DYNAMICS {
    tag "Deconvolution"
    publishDir "${params.outdir}/evolution", mode: 'copy'

    input:
    path vcf

    output:
    path "subclones.csv"

    script:
    """
    python3 ../scripts/clonal_deconvolution.py --input ${vcf}
    """
}

workflow {
    vcf_ch = SOMATIC_CALLING(params.primary, params.relapse, params.genome)
    CLONAL_DYNAMICS(vcf_ch)
}