# install micromamba
"${SHELL}" <(curl -L micro.mamba.pm/install.sh)

# ceate a vitual environment
micromamba create -n TRILL python=3.10 ; micromamba activate TRILL
micromamba install -c pytorch -c nvidia pytorch=2.1.2 pytorch-cuda=12.1 torchdata
micromamba install -c conda-forge openbabel pdbfixer swig openmm smina fpocket vina openff-toolkit openmmforcefields setuptools=69.5.1
micromamba install -c bioconda foldseek pyrsistent
micromamba install -c "dglteam/label/cu121" dgl
# micromamba install -c pyg pyg pytorch-cluster pytorch-sparse pytorch-scatter
# The cuda environment is not detected on the log-in node, so micromamba prefer to automatically update pytorch to a CPU version
# Therefore specify the CUDA version explicitly to avoid Micromamba switching to the CPU version.
micromamba install -c pyg -c conda-forge -c pytorch pytorch=2.1.2 pytorch-cuda=12.1 pyg pytorch-cluster pytorch-sparse pytorch-scatter
pip install git+https://github.com/martinez-zacharya/lightdock.git@03a8bc4888c0ff8c98b7f0df4b3c671e3dbf3b1f git+https://github.com/martinez-zacharya/ECPICK.git setuptools==69.5.1

# install trill
pip install trill-proteins

# # resolve broken requirements by degrade prody
# pip check
# pip index versions prody
# pip install prody==2.3.1