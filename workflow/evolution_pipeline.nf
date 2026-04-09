nextflow.enable.dsl=2

log.info """\
    C A N C E R   C L O N A L   E V O L U T I O N
    =============================================
    input_vaf    : ${params.vaf_data}
    outdir       : ${params.outdir}
    """
    .stripIndent()

process CLUSTER_VARIANTS {
    tag "BGMM on VAF data"

    input:
    path vaf_csv

    output:
    path "subclones.csv"

    script:
    """
    python ${projectDir}/scripts/clonal_deconvolution.py ${vaf_csv}
    """
}

workflow {
    vaf_ch = Channel.fromPath(params.vaf_data, checkIfExists: true)
    CLUSTER_VARIANTS(vaf_ch)
}
