# submit via "llsubmit job.ll"
# check status with "llq"
# @ job_name = job
# @ job_type = BLUEGENE
# Fichier sortie standard du travail
# @ output = out.$(jobid)
# Fichier erreur standard du travail
# @ error = $(output)
# Temps elapsed maximum demande
# @ wall_clock_limit = 0:20:00
# Taille partition d'execution
# @ bg_size = 1024
# @ queue

mpirun -mode VN -np 4096 -exe $WORKDIR/perf1/powerpc64/special \
  -args "-c bgpdma=2 -mpi init.hoc" \
  -env "LD_LIBRARY_PATH=/bgsys/drivers/ppcfloor/gnu-linux/lib:/bgsys/drivers/ppcfloor/runtime/SPI"

