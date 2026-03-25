#/bin/bin -l

for f in $(seq 1 120); do
    

    DIR="~/data/"
    DATA="slice${f}" # without .h5    
    SPOKES=8
    
    f_padded=$(printf "%03d" $f)  # zero-pad the number to 3 digits
    COIL_MAP="coil_map_slice_${f_padded}" 
  
    echo "> DIR: ${DIR}"
    echo "> DATA: ${DATA}"
    echo "> COIL_MAP: ${COIL_MAP}"
    echo "> SPOKES: ${SPOKES}"

    # reconstruct slice by slice
    python dce_recon_dgrasp_echoes.py --dir ${DIR} --data ${DATA} --coil_map ${COIL_MAP} --spokes_per_frame ${SPOKES} 


    # convert the .h5 file to dicom
    # python dcm_recon.py --dir ${DIR} --h5py ${DATA} --spokes_per_frame ${SPOKES}
done
