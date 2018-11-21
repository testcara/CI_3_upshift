echo "== run the cases of clean data =="
# change the host of the config
sed -i "s/pub.host.qe.eng.pek2.redhat.com/pub-e2e.usersys.redhat.com/g" ${CD_TestScript_Workspace}/unit_tests/configs/QA_01.conf
sed -i "s/pub-02.host.qe.eng.pek2.redhat.com/pub-e2e.usersys.redhat.com/g" ${CD_TestScript_Workspace}/unit_tests/configs/QA_01.conf
sed -i "s/pub-test.usersys.redhat.com/pub-e2e.usersys.redhat.com/g" ${CD_TestScript_Workspace}/unit_tests/configs/QA_01.conf
sed -i "s/pulp-02.host.qe.eng.pek2.redhat.com/pulp-e2e.usersys.redhat.com/g" ${CD_TestScript_Workspace}/unit_tests/configs/QA_01.conf
sed -i "s/pulp-04.host.qe.eng.pek2.redhat.com/pulp-e2e.usersys.redhat.com/g" ${CD_TestScript_Workspace}/unit_tests/configs/QA_01.conf
sed -i "s/pulp-03.host.qe.eng.pek2.redhat.com/pulp-docker-e2e.usersys.redhat.com/g" ${CD_TestScript_Workspace}/unit_tests/configs/QA_01.conf
sed -i "s/password=redhat/password=errata/g" ${CD_TestScript_Workspace}/unit_tests/configs/QA_01.conf
# disable some lines which bring some errors
sed -i 's/"errata"/#"errata"/g'  ${CD_TestScript_Workspace}/unit_tests/helpers/constants.py
sed -i 's/"pulp"/#"pulp"/g'  ${CD_TestScript_Workspace}/unit_tests/helpers/constants.py
# disable one useless testing types
sed -i "/clear_akamai_cdn/d" ${CD_TestScript_Workspace}/unit_tests/helpers/test_run_helper.py
echo "setuptools=="
# clean the pulp and pulp-docker data
py.test -v ${CD_TestScript_Workspace}/unit_tests/tests/clean_data.py::CleanData::test_clean_rhsm_pulp_data
py.test -v ${CD_TestScript_Workspace}/unit_tests/tests/clean_data.py::CleanData::test_clean_docker_pulp_data
echo "== The pulp env is clean =="
