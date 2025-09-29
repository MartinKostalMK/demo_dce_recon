#/bin/bin -l

#for f in $(seq -w 136 300); do
    f="90"
    #DIR="/home/genekim/projects/dgrasp_recon/gsi_arm1/1104"
    DIR="G:/Project-BreastDCEMRI/GSI-Arm1/1101/RAW_DATA"
    DATA="slice${f}" # without .h5

    SPOKES=35

    echo "> DIR: ${DIR}"
    echo "> DATA: ${DATA}"
    echo "> SPOKES: ${SPOKES}"

    # reconstruct slice by slice
    python dce_recon_dgrasp_echoes.py --dir ${DIR} --data ${DATA} --spokes_per_frame ${SPOKES} 

    # convert the .h5 file to dicom
    # python dcm_recon.py --dir ${DIR} --h5py ${DATA} --spokes_per_frame ${SPOKES}
#done