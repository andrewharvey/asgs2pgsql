#!/bin/bash

source ./global-vars.sh

mkdir -p "$asgs_dir/"

# arguments
#  1. Volume
#  2. dataset name
#  3. dataset access key
#  4. date
#  5. release date
#  6. release string
#  7. optional output dataset name
function download {
  echo ""
  echo "Volume $1..."
  if [ -z "$7" ]
    then
      wget --no-clobber -O "$asgs_dir/127005500${1}_$2" "http://www.abs.gov.au/ausstats/subscriber.nsf/log?openagent&127005500${1}_$2&1270.0.55.00$1&Data%20Cubes&$3&0&$4&$5&$6"
    else
      wget --no-clobber -O "$asgs_dir/127005500${1}_$7" "http://www.abs.gov.au/ausstats/subscriber.nsf/log?openagent&127005500${1}_$2&1270.0.55.00$1&Data%20Cubes&$3&0&$4&$5&$6" 
  fi
}

# The following is automatically generated using 00-make-download-code.sh

# ASGS Volume 1
# ABS Publication: 1270.0.55.001
download 1 "mb_2011_nsw_csv.zip" "E54CFCFB843BA38FCA257801000C657D" "July 2011" "23.12.2010" "Latest"
download 1 "mb_2011_vic_csv.zip" "15193F13CA390334CA257801000C6714" "July 2011" "23.12.2010" "Latest"
download 1 "mb_2011_qld_csv.zip" "BD762B8302052E9CCA257801000C67CF" "July 2011" "23.12.2010" "Latest"
download 1 "mb_2011_sa_csv.zip" "38DB08C011A3FBA4CA257801000C686A" "July 2011" "23.12.2010" "Latest"
download 1 "mb_2011_wa_csv.zip" "62F16C26CA6980DFCA257801000C68BB" "July 2011" "23.12.2010" "Latest"
download 1 "mb_2011_tas_csv.zip" "138B02A38FB0181DCA257801000C6918" "July 2011" "23.12.2010" "Latest"
download 1 "mb_2011_nt_csv.zip" "4E1867EAC89EDF34CA257801000C6954" "July 2011" "23.12.2010" "Latest"
download 1 "mb_2011_act_csv.zip" "A0CB326A96CD8EC0CA257801000C6973" "July 2011" "23.12.2010" "Latest"
download 1 "mb_2011_ot_csv.zip" "77AC708E385A6AEFCA257801000C6998" "July 2011" "23.12.2010" "Latest"
download 1 "sa1_2011_aust_csv.zip" "5AD36D669F284E70CA257801000C69BE" "July 2011" "23.12.2010" "Latest"
download 1 "sa2_2011_aust_csv.zip" "0C1F9B2158B14477CA257801000C6A3B" "July 2011" "23.12.2010" "Latest"
download 1 "sa3_2011_aust_csv.zip" "C468E0C71D4701D1CA257801000C6A58" "July 2011" "23.12.2010" "Latest"
download 1 "sa4_2011_aust_csv.zip" "E3F60732981FD9DACA257801000C6A74" "July 2011" "23.12.2010" "Latest"
download 1 "gccsa_2011_aust_csv.zip" "B7241FCBE7129A8FCA257801000C6A8D" "July 2011" "23.12.2010" "Latest"
download 1 "ste_2011_aust_csv.zip" "D8E535167A7188F6CA257801000C6AAE" "July 2011" "23.12.2010" "Latest"
download 1 "mb_2011_nsw_shape.zip" "24D5D6CF2AE953EECA257801000C80C3" "July 2011" "23.12.2010" "Latest"
download 1 "mb_2011_vic_shape.zip" "85F5B2ED8E3DC957CA257801000CA953" "July 2011" "23.12.2010" "Latest"
download 1 "mb_2011_qld_shape.zip" "28231DC5E634B991CA257801000CC024" "July 2011" "23.12.2010" "Latest"
download 1 "mb_2011_sa_shape.zip" "80D17614D3554120CA257801000CCDCF" "July 2011" "23.12.2010" "Latest"
download 1 "mb_2011_wa_shape.zip" "E1F9D7EA5D7FE609CA257801000CD692" "July 2011" "23.12.2010" "Latest"
download 1 "mb_2011_tas_shape.zip" "2A51C083AC8C54F5CA257801000CE3B5" "July 2011" "23.12.2010" "Latest"
download 1 "mb_2011_nt_shape.zip" "28330E3BC3BD9664CA257801000CED32" "July 2011" "23.12.2010" "Latest"
download 1 "mb_2011_act_shape.zip" "1911A225354236D2CA257801000CEECB" "July 2011" "23.12.2010" "Latest"
download 1 "mb_2011_ot_shape.zip" "2DCDFCEB2683BAE8CA257801000CEFE7" "July 2011" "23.12.2010" "Latest"
download 1 "sa1_2011_aust_shape.zip" "24A18E7B88E716BDCA257801000D0AF1" "July 2011" "23.12.2010" "Latest"
download 1 "sa2_2011_aust_shape.zip" "7130A5514535C5FCCA257801000D3FBD" "July 2011" "23.12.2010" "Latest"
download 1 "sa3_2011_aust_shape.zip" "AD2BD90E5DC0F4C7CA257801000D59E3" "July 2011" "23.12.2010" "Latest"
download 1 "sa4_2011_aust_shape.zip" "B18D49356F3FDA5FCA257801000D6D2E" "July 2011" "23.12.2010" "Latest"
download 1 "gccsa_2011_aust_shape.zip" "E0FC2223AF731E0ACA257801000D7B54" "July 2011" "23.12.2010" "Latest"
download 1 "ste_2011_aust_shape.zip" "1D26EC44E6ABD911CA257801000D8779" "July 2011" "23.12.2010" "Latest"


# ASGS Volume 2
# ABS Publication: 1270.0.55.002
download 2 "Indigenous_Structure_Allocation_2011.zip" "BD804B85D8A4CDBBCA2579C000108D70" "July 2011" "14.03.2012" "Latest"
download 2 "iloc_2011_aust_csv.zip" "AF9FD7D0B10480EDCA2579A700178836" "July 2011" "20.02.2012" "Latest"
download 2 "iare_2011_aust_csv.zip" "76807848BF1A45ACCA2579A70017889C" "July 2011" "20.02.2012" "Latest"
download 2 "ireg_2011_aust_csv.zip" "5C951FA2B92BA234CA2579A7001788C3" "July 2011" "20.02.2012" "Latest"
download 2 "iare_2011_aust_shape.zip" "30B219BC2C1BA5DDCA2579A7001790DC" "July 2011" "20.02.2012" "Latest"
download 2 "iloc_2011_aust_shape.zip" "6EE37FF7D6F9B0A8CA2579A70017A494" "July 2011" "20.02.2012" "Latest"
download 2 "ireg_2011_aust_shape.zip" "5C2F21B87633B4B6CA2579A70017B643" "July 2011" "20.02.2012" "Latest"


# ASGS Volume 3
# ABS Publication: 1270.0.55.003
download 3 "lga_2011_nsw_csv.zip" "A0DFB7A41B87A76ECA257937000CBB42" "July 2011" "31.10.2011" "Previous"
download 3 "lga_2011_vic_csv.zip" "22BDB665B1796864CA257937000CBC83" "July 2011" "31.10.2011" "Previous"
download 3 "lga_2011_qld_csv.zip" "5C6E8F1B005AEC6FCA257937000CBCF4" "July 2011" "31.10.2011" "Previous"
download 3 "lga_2011_sa_csv.zip" "F064876E88FB7F1ECA257937000CBD5B" "July 2011" "31.10.2011" "Previous"
download 3 "lga_2011_wa_csv.zip" "464D8A897C7FEC4BCA257937000CBDA2" "July 2011" "31.10.2011" "Previous"
download 3 "lga_2011_tas_csv.zip" "E8BB0ABD3CF1550BCA257937000CBDFB" "July 2011" "31.10.2011" "Previous"
download 3 "lga_2011_nt_csv.zip" "9B7B236D1BCFFE2CCA257937000CBE3E" "July 2011" "31.10.2011" "Previous"
download 3 "lga_2011_act_csv.zip" "A71E3C0C4A54BBB3CA257937000CBE67" "July 2011" "31.10.2011" "Previous"
download 3 "lga_2011_ot_csv.zip" "5475D4A389AB313CCA257937000CBEA1" "July 2011" "31.10.2011" "Previous"
download 3 "poa_2011_aust_csv.zip" "7A0CD4B1AD71C814CA2578D40012D4B2" "July 2011" "22.07.2011" "Previous"
download 3 "ssc_2011_aust_csv.zip" "414A81A24C3049A8CA2578D40012D50C" "July 2011" "22.07.2011" "Previous"
download 3 "ced_2011_aust_csv.zip" "F85EC44BA66E1AF8CA2578D40012D57B" "July 2011" "22.07.2011" "Previous"
download 3 "sed_2011_aust_csv.zip" "D528608C024844C9CA2578D40012D5E0" "July 2011" "22.07.2011" "Previous"
download 3 "nrmr_2011_aust_csv.zip" "3980F9D5AF92E81ECA2578D40012D63E" "July 2011" "22.07.2011" "Previous"
download 3 "add_2011_aust.zip" "AE06FFEB1486E2C5CA2579F30011EADB" "July 2011" "04.05.2012" "Latest" "add_2011_aust_csv.zip"
download 3 "tr_2011_aust_csv.zip" "38C408A89BBA0027CA2578D40012D70A" "July 2011" "22.07.2011" "Previous"
download 3 "lga_2011_aust_shape.zip" "4A320EE17A293459CA257937000CC967" "July 2011" "31.10.2011" "Previous"
download 3 "poa_2011_aust_shape.zip" "71B4572D909B934ECA2578D40012FE0D" "July 2011" "22.07.2011" "Previous"
download 3 "ssc_2011_aust_shape.zip" "D68DFFC14D31F4E1CA2578D40013268D" "July 2011" "22.07.2011" "Previous"
download 3 "ced_2011_aust_shape.zip" "AFFAF0F44528F2EFCA2578D40013CA06" "July 2011" "22.07.2011" "Previous"
download 3 "sed_2011_aust_shape.zip" "1F692001AC7E460DCA2578D40013567C" "July 2011" "22.07.2011" "Previous"
download 3 "nrmr_2011_aust_shape.zip" "6F23BC29F5CA27F8CA2578D40013679F" "July 2011" "22.07.2011" "Previous"
download 3 "add_2011_aust_shape.zip" "582C067EAE26C41ACA2578D4001375F4" "July 2011" "22.07.2011" "Previous"
download 3 "tr_2011_aust_shape.zip" "7140033784CE5EAFCA2578D4001383F7" "July 2011" "22.07.2011" "Previous"

download 3 "lga_2015_nsw_csv.zip" "0AF51A7ADF9181A1CA257E8400142CAF" "July 2015" "17.07.2015" "Latest"
download 3 "lga_2015_vic_csv.zip" "32D2804F747414DECA257E8400142FDB" "July 2015" "17.07.2015" "Latest"
download 3 "lga_2015_qld_csv.zip" "10828E8DF958AFD4CA257E840014301D" "July 2015" "17.07.2015" "Latest"
download 3 "lga_2015_sa_csv.zip" "6E8B6D69B0BD8DACCA257E8400143074" "July 2015" "17.07.2015" "Latest"
download 3 "lga_2015_wa_csv.zip" "5CE879207472A620CA257E84001430A5" "July 2015" "17.07.2015" "Latest"
download 3 "lga_2015_tas_csv.zip" "8D5B98B698EBDB2ECA257E84001430D8" "July 2015" "17.07.2015" "Latest"
download 3 "lga_2015_nt_csv.zip" "2D17E503B7AF209CCA257E8400143239" "July 2015" "17.07.2015" "Latest"
download 3 "lga_2015_act_csv.zip" "6E2B938FAC759839CA257E8400143260" "July 2015" "17.07.2015" "Latest"
download 3 "lga_2015_ot_csv.zip" "E3157A9E3A2CF23ECA257E8400143355" "July 2015" "17.07.2015" "Latest"
download 3 "tr_2015_aust_csv.zip" "99F74DD9E63EFE24CA257E840014337D" "July 2015" "17.07.2015" "Latest"
download 3 "lga_2015_aust_shape.zip" "54F1418AFBEDD91CCA257E8400143B95" "July 2015" "17.07.2015" "Latest"
download 3 "tr_2015_aust_shape.zip" "26334A5E2F193087CA257E8400144CC4" "July 2015" "17.07.2015" "Latest"

# ASGS Volume 4
# ABS Publication: 1270.0.55.004
download 4 "sua_2011_aust_csv.zip" "CBAC735918B75C85CA257A9800139B45" "July 2011" "16.10.2012" "Latest"
download 4 "sa2_sua_2011_aust_csv.zip" "87578110AA869B71CA257A9800139DAC" "July 2011" "16.10.2012" "Latest"
download 4 "ucl_2011_aust_csv.zip" "28A76D426FCA5859CA257A9800139DD1" "July 2011" "16.10.2012" "Latest"
download 4 "sa1_ucl_sosr_sos_2011_aust_csv.zip" "C52313843E4B9D3BCA257A9800139DF3" "July 2011" "16.10.2012" "Latest"
download 4 "sua_2011_aust_shape.zip" "704255912D2C4DC4CA257A9800149AD0" "July 2011" "16.10.2012" "Latest"
download 4 "ucl_2011_aust_shape.zip" "52B516A3309048CBCA257A980013A96D" "July 2011" "16.10.2012" "Latest"
download 4 "sosr_2011_aust_shape.zip" "037E310AB1A6E0CDCA257A980013BA66" "July 2011" "16.10.2012" "Latest"
download 4 "sos_2011_aust_shape.zip" "09598BD74AC10B0CCA257A980013CAD8" "July 2011" "16.10.2012" "Latest"


# ASGS Volume 5
# ABS Publication: 1270.0.55.005
download 5 "ra_2011_aust.zip" "2F6D222C94BC11F7CA257B03000D6DDC" "July 2011" "31.01.2013" "Latest"
download 5 "sa1_2011_ra_2011_aust.zip" "90EDF571EC21BFA0CA257B03000D6E73" "July 2011" "31.01.2013" "Latest"
download 5 "ra_2001_aust_shape.zip" "C712776994895856CA257B03000D7599" "July 2011" "31.01.2013" "Latest"


# ASGS Volume 6
# ABS Publication: 1270.0.55.006
download 6 "CG_SA1_2011_LGA_2011.zip" "BE13557485F89EA2CA257A29001973E9" "July 2011" "27.06.2012" "Latest"
download 6 "CG_SA1_2011_SLA_2011.zip" "3C0949BB279960E3CA257A2900197618" "July 2011" "27.06.2012" "Latest"
download 6 "CG_SA2_2011_SLA_2011.zip" "726205569C85CBBECA257A2900197687" "July 2011" "27.06.2012" "Latest"
download 6 "CG_SA2_2011_LGA_2011.zip" "761D9D4617DE309CCA257A29001976B8" "July 2011" "27.06.2012" "Latest"
download 6 "cg_sa2_2011_ssd_2011.zip" "91BEB0F8CF3D3C3CCA257A4B0014E7F5" "July 2011" "31.07.2012" "Latest"
download 6 "CG_SA2_2011_SD_2011.zip" "D3F4BBFDEE441641CA257A29001976DF" "July 2011" "27.06.2012" "Latest"
download 6 "cg_sa2_2011_lfr_2007.zip" "37ADC9E204E5B31ACA257A4B0014E87E" "July 2011" "31.07.2012" "Latest"
download 6 "cg_sa2_2011_ra_2011.zip" "DD6F47368D7AD64FCA257B03000D95F3" "July 2011" "31.01.2013" "Latest"
download 6 "CG_CD_2006_SA1_2011.zip" "9127B49166B921B6CA257A2900197703" "July 2011" "24.01.2013" "Latest"
download 6 "CG_CD_2006_SA2_2011.zip" "D2AA0EEEE9B555C1CA257A2900197809" "July 2011" "27.06.2012" "Latest"
download 6 "CG_CD_2006_SA3_2011.zip" "2A817A0A9D355015CA257A2900197878" "July 2011" "27.06.2012" "Latest"
download 6 "CG_CD_2006_SA4_2011.zip" "1A03349786486207CA257A29001978C5" "July 2011" "27.06.2012" "Latest"
download 6 "cg_cd_2006_gccsa_2011.zip" "0FF8563481735F26CA257A4B0014E8AE" "July 2011" "31.07.2012" "Latest"
download 6 "CG_SLA_2011_SA2_2011.zip" "7BEB73293C9A576ACA257A2900197917" "July 2011" "27.06.2012" "Latest"
download 6 "CG_SLA_2011_SA3_2011.zip" "ED88141A4029C2B3CA257A2900197945" "July 2011" "27.06.2012" "Latest"
download 6 "cg_sla_2011_sa4_2011.zip" "76710B06930DFC2CCA257A4B0014E904" "July 2011" "31.07.2012" "Latest"
download 6 "cg_sla_2011_ra_2011.zip" "5B338D4948A93DC8CA257B03000D96B3" "July 2011" "31.01.2013" "Latest"
download 6 "CG_LGA_2011_SA3_2011.zip" "9B19F5E9356E5914CA257A290019796A" "July 2011" "27.06.2012" "Latest"
download 6 "cg_lga_2011_ra_2011.zip" "5987CA7A07B468C8CA257B03000D9703" "July 2011" "31.01.2013" "Latest"
download 6 "cg_lga_2011_sa4_2011.zip" "AB353A78027B38E9CA257A4B0014E92D" "July 2011" "31.07.2012" "Latest"
download 6 "CG_SD_2011_SA4_2011.zip" "CAE5EBC1BE28194CCA257A290019798C" "July 2011" "27.06.2012" "Latest"
download 6 "cg_lfr_2007_sa4_2011.zip" "34F63CAE3D4501D5CA257A4B0014E94F" "July 2011" "31.07.2012" "Latest"
download 6 "CG_POSTCODE_2011_SA2_2011.zip" "70A3CE8A2E6F9A6BCA257A29001979B2" "July 2011" "27.06.2012" "Latest"
download 6 "cg_postcode_2011_sa3_2011.zip" "07308A67BF786E9FCA257A4B0014E971" "July 2011" "31.07.2012" "Latest"
download 6 "cg_postcode_2011_sa4_2011.zip" "86D6D239B79547A2CA257A4B0014E9A0" "July 2011" "31.07.2012" "Latest"
download 6 "CG_POSTCODE_2011_SLA_2011.zip" "43F65DB2C91645C4CA257A29001979E2" "July 2011" "27.06.2012" "Latest"
download 6 "CG_POSTCODE_2011_LGA_2011.zip" "4775CAD900B5F56FCA257A2900197A14" "July 2011" "27.06.2012" "Latest"
download 6 "cg_postcode_2011_ra_2006.zip" "2A5F5C7EBD300BB2CA257A4B0014E9C7" "July 2011" "31.07.2012" "Latest"
download 6 "cg_postcode_2012_ra_2011.zip" "8529D93FC7EFF6BACA257B12000F7D73" "July 2011" "15.02.2013" "Latest"


