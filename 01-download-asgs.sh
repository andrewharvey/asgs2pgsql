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
    if [ -z "$7" ] ; then
        if [ "$1" == "cg" ] ; then
            wget --no-clobber -O "$asgs_dir/${1}_$2" "http://www.abs.gov.au/ausstats/subscriber.nsf/log?openagent&${1}_$2&1270.0.55.00$1&Data%20Cubes&$3&0&$4&$5&$6"
        else
            wget --no-clobber -O "$asgs_dir/127005500${1}_$2" "http://www.abs.gov.au/ausstats/subscriber.nsf/log?openagent&127005500${1}_$2&1270.0.55.00$1&Data%20Cubes&$3&0&$4&$5&$6"
        fi
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





download 1 "mb_2016_nsw_csv.zip" "1FC672E70A77D52FCA257FED0013A0F7" "July 2016" "12.07.2016" "Latest"
download 1 "mb_2016_vic_csv.zip" "F1EA82ECA7A762BCCA257FED0013A253" "July 2016" "12.07.2016" "Latest"
download 1 "mb_2016_qld_csv.zip" "A6A81C7C2CE74FAACA257FED0013A344" "July 2016" "12.07.2016" "Latest"
download 1 "mb_2016_sa_csv.zip" "5763C01CA9A3E566CA257FED0013A38D" "July 2016" "12.07.2016" "Latest"
download 1 "mb_2016_wa_csv.zip" "6C293909851DCBFFCA257FED0013A3BF" "July 2016" "12.07.2016" "Latest"
download 1 "mb_2016_tas_csv.zip" "A9B01B4DACD0BFEFCA257FED0013A3FC" "July 2016" "12.07.2016" "Latest"
download 1 "mb_2016_nt_csv.zip" "CA6464FAA0777F80CA257FED0013A429" "July 2016" "12.07.2016" "Latest"
download 1 "mb_2016_act_csv.zip" "10AFEFD3A73B902ECA257FED0013A455" "July 2016" "12.07.2016" "Latest"
download 1 "mb_2016_ot_csv.zip" "DE3FEF9908F4CF9BCA257FED0013A48F" "July 2016" "12.07.2016" "Latest"
download 1 "sa1_2016_aust_csv.zip" "10E21199BF8C37F7CA257FED0013A4BB" "July 2016" "12.07.2016" "Latest"
download 1 "sa2_2016_aust_csv.zip" "9F6E4EB4E23B269FCA257FED0013A4F8" "July 2016" "12.07.2016" "Latest"
download 1 "sa3_2016_aust_csv.zip" "615EF9EE021AD6A3CA257FED0013A555" "July 2016" "12.07.2016" "Latest"
download 1 "sa4_2016_aust_csv.zip" "BAA10E85013E0996CA257FED0013A580" "July 2016" "12.07.2016" "Latest"
download 1 "gccsa_2016_aust_csv.zip" "4E0B1853ECFC3E57CA257FED0013A5A7" "July 2016" "12.07.2016" "Latest"
download 1 "ste_2016_aust_csv.zip" "6AA469B77B833813CA257FED0013A5CC" "July 2016" "12.07.2016" "Latest"
download 1 "mb_2016_nsw_shape.zip" "E9FA17AFA7EB9FEBCA257FED0013A5F5" "July 2016" "12.07.2016" "Latest"
download 1 "mb_2016_vic_shape.zip" "04F12B9E465AE765CA257FED0013B20F" "July 2016" "12.07.2016" "Latest"
download 1 "mb_2016_qld_shape.zip" "A17EA45AB7CC5D5CCA257FED0013B7F6" "July 2016" "12.07.2016" "Latest"
download 1 "mb_2016_sa_shape.zip" "793662F7A1C04BD6CA257FED0013BCB0" "July 2016" "12.07.2016" "Latest"
download 1 "mb_2016_wa_shape.zip" "2634B61773C82931CA257FED0013BE47" "July 2016" "12.07.2016" "Latest"
download 1 "mb_2016_tas_shape.zip" "854152CB547DE707CA257FED0013C180" "July 2016" "12.07.2016" "Latest"
download 1 "mb_2016_nt_shape.zip" "31364C9DFE4CC667CA257FED0013C4F6" "July 2016" "12.07.2016" "Latest"
download 1 "mb_2016_act_shape.zip" "21B8D5684405A2A7CA257FED0013C567" "July 2016" "12.07.2016" "Latest"
download 1 "mb_2016_ot_shape.zip" "9001CEC5D0573AF4CA257FED0013C5F0" "July 2016" "12.07.2016" "Latest"
download 1 "sa1_2016_aust_shape.zip" "6F308688D810CEF3CA257FED0013C62D" "July 2016" "12.07.2016" "Latest"
download 1 "sa2_2016_aust_shape.zip" "A09309ACB3FA50B8CA257FED0013D420" "July 2016" "12.07.2016" "Latest"
download 1 "sa3_2016_aust_shape.zip" "43942523105745CBCA257FED0013DB07" "July 2016" "12.07.2016" "Latest"
download 1 "sa4_2016_aust_shape.zip" "C65BC89E549D1CA3CA257FED0013E074" "July 2016" "12.07.2016" "Latest"
download 1 "gccsa_2016_aust_shape.zip" "FD348608563DBFEACA257FED0013E500" "July 2016" "12.07.2016" "Latest"
download 1 "ste_2016_aust_shape.zip" "65819049BE2EB089CA257FED0013E865" "July 2016" "12.07.2016" "Latest"
download cg "mb_2011_mb_2016.zip" "4E9930D30D02872ACA257FED0014BEFE" "July 2016" "12.07.2016" "Latest"
download cg "sa1_2011_sa1_2016.zip" "7FA4ED413ECF9336CA257FED0014C10D" "July 2016" "12.07.2016" "Latest"
download cg "sa2_2011_sa2_2016.zip" "C9CFBB94B52B200DCA257FED0014C198" "July 2016" "12.07.2016" "Latest"
download cg "sa3_2011_sa3_2016.zip" "609E67A0AA06EC32CA257FED0014C1C0" "July 2016" "12.07.2016" "Latest"
download cg "sa4_2011_sa4_2016.zip" "5221E9CC649099CACA257FED0014C1E9" "July 2016" "12.07.2016" "Latest"
download cg "gccsa_2011_gccsa_2016.zip" "BB9452B669226FDACA257FED0014C20B" "July 2016" "12.07.2016" "Latest"
download 1 "aus_2016_aust_shape.zip" "5503B37F8055BFFECA2581640014462C" "July 2016" "24.07.2017" "Latest"



# ASGS Volume 2
# ABS Publication: 1270.0.55.002
download 2 "Indigenous_Structure_Allocation_2011.zip" "BD804B85D8A4CDBBCA2579C000108D70" "July 2011" "14.03.2012" "Latest"
download 2 "iloc_2011_aust_csv.zip" "AF9FD7D0B10480EDCA2579A700178836" "July 2011" "20.02.2012" "Latest"
download 2 "iare_2011_aust_csv.zip" "76807848BF1A45ACCA2579A70017889C" "July 2011" "20.02.2012" "Latest"
download 2 "ireg_2011_aust_csv.zip" "5C951FA2B92BA234CA2579A7001788C3" "July 2011" "20.02.2012" "Latest"
download 2 "iare_2011_aust_shape.zip" "30B219BC2C1BA5DDCA2579A7001790DC" "July 2011" "20.02.2012" "Latest"
download 2 "iloc_2011_aust_shape.zip" "6EE37FF7D6F9B0A8CA2579A70017A494" "July 2011" "20.02.2012" "Latest"
download 2 "ireg_2011_aust_shape.zip" "5C2F21B87633B4B6CA2579A70017B643" "July 2011" "20.02.2012" "Latest"





download 2 "indigenous_structure_allocation_2016.zip" "80616E14CFA32B4DCA25802C0013F9EA" "July 2016" "13.09.2016" "Latest"
download 2 "iloc_2016_aust_csv.zip" "ACA1CDFC0BF96596CA25802C0013FAE6" "July 2016" "13.09.2016" "Latest"
download 2 "iare_2016_aust_csv.zip" "77E77B329AC89332CA25802C0013FB0A" "July 2016" "13.09.2016" "Latest"
download 2 "ireg_2016_aust_csv.zip" "90A95D8A109C3A53CA25802C0013FB37" "July 2016" "13.09.2016" "Latest"
download 2 "iloc_2016_aust_shape.zip" "8EBE82D4E1C6990CCA25802C0013FB58" "July 2016" "13.09.2016" "Latest"
download 2 "iare_2016_aust_shape.zip" "97C87A1ECEF91649CA25802C00140050" "July 2016" "13.09.2016" "Latest"
download 2 "ireg_2016_aust_shape.zip" "DC766D359CEDF5ECCA25802C00140496" "July 2016" "13.09.2016" "Latest"
download cg "iloc_2011_iloc_2016.zip" "B12ABB87DFF29B37CA25802C001427E1" "July 2016" "13.09.2016" "Latest"
download cg "iare_2011_iare_2016.zip" "2DB0D7A9B8A06491CA25802C00142805" "July 2016" "13.09.2016" "Latest"
download cg "ireg_2011_ireg_2016.zip" "43B4694A5117AD38CA25802C00142829" "July 2016" "13.09.2016" "Latest"



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
download 3 "add_2011_aust.zip" "AE06FFEB1486E2C5CA2579F30011EADB" "July 2011" "04.05.2012" "Latest"
download 3 "tr_2011_aust_csv.zip" "38C408A89BBA0027CA2578D40012D70A" "July 2011" "22.07.2011" "Previous"
download 3 "lga_2011_aust_shape.zip" "4A320EE17A293459CA257937000CC967" "July 2011" "31.10.2011" "Previous"
download 3 "poa_2011_aust_shape.zip" "71B4572D909B934ECA2578D40012FE0D" "July 2011" "22.07.2011" "Previous"
download 3 "ssc_2011_aust_shape.zip" "D68DFFC14D31F4E1CA2578D40013268D" "July 2011" "22.07.2011" "Previous"
download 3 "ced_2011_aust_shape.zip" "AFFAF0F44528F2EFCA2578D40013CA06" "July 2011" "22.07.2011" "Previous"
download 3 "sed_2011_aust_shape.zip" "1F692001AC7E460DCA2578D40013567C" "July 2011" "22.07.2011" "Previous"
download 3 "nrmr_2011_aust_shape.zip" "6F23BC29F5CA27F8CA2578D40013679F" "July 2011" "22.07.2011" "Previous"
download 3 "add_2011_aust_shape.zip" "582C067EAE26C41ACA2578D4001375F4" "July 2011" "22.07.2011" "Previous"
download 3 "tr_2011_aust_shape.zip" "7140033784CE5EAFCA2578D4001383F7" "July 2011" "22.07.2011" "Previous"


download 3 "lga_2013_nsw_csv.zip" "0DCDCC9D7A1483CCCA257BB000115790" "July 2013" "23.07.2013" "Latest"
download 3 "lga_2013_vic_csv.zip" "431C83067731553ACA257BB000115889" "July 2013" "23.07.2013" "Latest"
download 3 "lga_2013_qld_csv.zip" "798B7A702795D75ACA257BB0001158E8" "July 2013" "23.07.2013" "Latest"
download 3 "lga_2013_sa_csv.zip" "A4A271E1AB2F2290CA257BB000115924" "July 2013" "23.07.2013" "Latest"
download 3 "lga_2013_wa_csv.zip" "522B22ECFC19F878CA257BB00011594C" "July 2013" "23.07.2013" "Latest"
download 3 "lga_2013_tas_csv.zip" "91361B9F31C38FAACA257BB000115976" "July 2013" "23.07.2013" "Latest"
download 3 "lga_2013_nt_csv.zip" "DC5FE79287EE47A9CA257BB000115991" "July 2013" "23.07.2013" "Latest"
download 3 "lga_2013_act_csv.zip" "C735F9D12AFC3616CA257BB0001159AD" "July 2013" "23.07.2013" "Latest"
download 3 "lga_2013_ot_csv.zip" "0BF6BBF7C36F745ECA257BB0001159CB" "July 2013" "23.07.2013" "Latest"
download 3 "ced_2013_aust_csv.zip" "CC688918DA139CF6CA257BB0001159F9" "July 2013" "23.07.2013" "Latest"
download 3 "tr_2013_aust_csv.zip" "24F4C44FA27C12F3CA257BB000115A35" "July 2013" "23.07.2013" "Latest"
download 3 "lga_2013_aust_shape.zip" "D56CC04B78B6E585CA257BB0001162D1" "July 2013" "23.07.2013" "Latest"
download 3 "ced_2013_aust_shp.zip" "390A0B8BBC1CFC9CCA257BB000117290" "July 2013" "23.07.2013" "Latest"
download 3 "tr_2013_aust_shape.zip" "CDD92DC573FC0E7DCA257BB00011802B" "July 2013" "23.07.2013" "Latest"

download 3 "lga_2014_nsw_csv.zip" "232CBF7DD0454102CA257D17001149B5" "July 2014" "17.07.2014" "Latest"
download 3 "lga_2014_vic_csv.zip" "13187DA29F2DE279CA257D1700114AC6" "July 2014" "17.07.2014" "Latest"
download 3 "lga_2014_qld_csv.zip" "349C676C46B15DB1CA257D1700114B15" "July 2014" "17.07.2014" "Latest"
download 3 "lga_2014_sa_csv.zip" "476229B8C9684DB5CA257D1700114B63" "July 2014" "17.07.2014" "Latest"
download 3 "lga_2014_wa_csv.zip" "8EA8618A3690CDE4CA257D1700114BA2" "July 2014" "17.07.2014" "Latest"
download 3 "lga_2014_tas_csv.zip" "9D8B4D2804FD94A9CA257D1700114BE5" "July 2014" "17.07.2014" "Latest"
download 3 "lga_2014_nt_csv.zip" "9D84833334E1F913CA257D1700114C1A" "July 2014" "17.07.2014" "Latest"
download 3 "lga_2014_act_csv.zip" "B6C8723473EA8F7CCA257D1700114C5A" "July 2014" "17.07.2014" "Latest"
download 3 "lga_2014_ot_csv.zip" "1C99EF64D49C740ECA257D1700114C87" "July 2014" "17.07.2014" "Latest"
download 3 "tr_2014_aust_csv.zip" "87CCB762B337A735CA257D1700114CB1" "July 2014" "17.07.2014" "Latest"
download 3 "lga_2014_aust_shape.zip" "0B5049C71C32D70BCA257D1700115539" "July 2014" "17.07.2014" "Latest"
download 3 "tr_2014_aust_shape.zip" "458DFB6FAFCF2585CA257D170011890C" "July 2014" "17.07.2014" "Latest"

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

download 3 "lga_2016_nsw_csv.zip" "83179EFA2D8AE0D4CA25802C001429BC" "July 2016" "13.09.2016" "Latest"
download 3 "lga_2016_vic_csv.zip" "419FC07E76D1FE47CA25802C00142A33" "July 2016" "13.09.2016" "Latest"
download 3 "lga_2016_qld_csv.zip" "88DB5BA4BCA98A55CA25802C00142A6A" "July 2016" "13.09.2016" "Latest"
download 3 "lga_2016_sa_csv.zip" "4D3F501A0ED2D53CCA25802C00142AB3" "July 2016" "13.09.2016" "Latest"
download 3 "lga_2016_wa_csv.zip" "7510DFF47FD01692CA25802C00142ADC" "July 2016" "13.09.2016" "Latest"
download 3 "lga_2016_tas_csv.zip" "952F0BCFD5DE2164CA25802C00142B0C" "July 2016" "13.09.2016" "Latest"
download 3 "lga_2016_nt_csv.zip" "C5CCBC3D0ED7F072CA25802C00142B3B" "July 2016" "13.09.2016" "Latest"
download 3 "lga_2016_act_csv.zip" "E5E5F15DA799B3E3CA25802C00142B5F" "July 2016" "13.09.2016" "Latest"
download 3 "lga_2016_ot_csv.zip" "41A73FEFF1D24142CA25802C00142B86" "July 2016" "13.09.2016" "Latest"
download 3 "poa_2016_aust_csv.zip" "BCC18002983CD965CA25802C00142BA4" "July 2016" "13.09.2016" "Latest"
download 3 "ssc_2016_aust_csv.zip" "42CEBC5514202AFDCA25802C00142C05" "July 2016" "13.09.2016" "Latest"
download 3 "add_2016_aust_csv.zip" "A66FF7C0C00D813ACA25802C00142C74" "July 2016" "13.09.2016" "Latest"
download 3 "nrmr_2016_aust_csv.zip" "A4F2048B37450464CA25802C00142CE0" "July 2016" "13.09.2016" "Latest"
download 3 "ced_2016_aust_csv.zip" "A515477175A704FCCA25802C00142D3C" "July 2016" "13.09.2016" "Latest"
download 3 "sed_2016_aust_csv.zip" "13E9880F47DACC52CA25802C00142D72" "July 2016" "13.09.2016" "Latest"
download 3 "tr_2016_aust_csv.zip" "6594F99849A0F96FCA25802C00142DAB" "July 2016" "13.09.2016" "Latest"
download 3 "lga_2016_aust_shape.zip" "6A6A6E8944937276CA25802C00142DD2" "July 2016" "13.09.2016" "Latest"
download 3 "poa_2016_aust_shape.zip" "4FB811FA48EECA7ACA25802C001432D0" "July 2016" "13.09.2016" "Latest"
download 3 "ssc_2016_aust_shape.zip" "5698C77C925DC4FACA25802C001439C5" "July 2016" "13.09.2016" "Latest"
download 3 "add_2016_aust_shape.zip" "5B5072F2D78C171CCA25802C00144684" "July 2016" "13.09.2016" "Latest"
download 3 "nrmr_2016_aust_shape.zip" "603B9704DC4CE786CA25802C001448D1" "July 2016" "13.09.2016" "Latest"
download 3 "ced_2016_aust_shape.zip" "447BE1AE2E3E7A3ACA25802C00144C3C" "July 2016" "13.09.2016" "Latest"
download 3 "sed_2016_aust_shape.zip" "AEC7DE3BB484A027CA25802C00145019" "July 2016" "13.09.2016" "Latest"
download 3 "tr_2016_aust_shape.zip" "1D72EF249FF3D344CA25802C0014541A" "July 2016" "13.09.2016" "Latest"
download cg "lga_2011_lga_2016.zip" "CC38E23C705764BECA25802C0014C3AF" "July 2016" "13.09.2016" "Latest"
download cg "poa_2011_poa_2016.zip" "3399EB98D8341DFFCA25802C0014C3D3" "July 2016" "13.09.2016" "Latest"
download cg "ssc_2011_ssc_2016.zip" "88C26D6A61CDA38ECA25802C0014C402" "July 2016" "13.09.2016" "Latest"
download cg "ced_2011_ced_2016.zip" "798C66D2F7552048CA25802C0014C447" "July 2016" "13.09.2016" "Latest"
download cg "sed_2011_sed_2016.zip" "5C37BAB187F19BB1CA25802C0014C468" "July 2016" "13.09.2016" "Latest"
download cg "tr_2011_tr_2016.zip" "7CCD1D2A997B4EC3CA25802C0014C485" "July 2016" "13.09.2016" "Latest"

download 3 "lga_2017_nsw_csv.zip" "3855C4D70AA592D7CA25816B00135935" "July 2017" "31.07.2017" "Latest"
download 3 "lga_2017_vic_csv.zip" "61200177C333C390CA25816B00135A17" "July 2017" "31.07.2017" "Latest"
download 3 "lga_2017_qld_csv.zip" "96090EE452468396CA25816B00135A4E" "July 2017" "31.07.2017" "Latest"
download 3 "lga_2017_sa_csv.zip" "C4093830DC5D91A5CA25816B00135A7E" "July 2017" "31.07.2017" "Latest"
download 3 "lga_2017_wa_csv.zip" "C18D9FDF553E8EF9CA25816B00135AA5" "July 2017" "31.07.2017" "Latest"
download 3 "lga_2017_tas_csv.zip" "6A2078BEB18198A5CA25816B00135AD3" "July 2017" "31.07.2017" "Latest"
download 3 "lga_2017_nt_csv.zip" "FECF9D93D46D65CECA25816B00135B00" "July 2017" "31.07.2017" "Latest"
download 3 "lga_2017_act_csv.zip" "F4A12D3415D0A859CA25816B00135B27" "July 2017" "31.07.2017" "Latest"
download 3 "lga_2017_ot_csv.zip" "A95E637EEA2F1ACCCA25816B00135B48" "July 2017" "31.07.2017" "Latest"
download 3 "ced_2017_aust_csv.zip" "4F2D0E9669562913CA25816B00135B67" "July 2017" "31.07.2017" "Latest"
download 3 "sed_2017_aust_csv.zip" "D1DCAE542D41B1BFCA25816B00135B9B" "July 2017" "31.07.2017" "Latest"
download 3 "lga_2017_aust_shp.zip" "F11A76BAD13A9F8FCA25816B00135BCA" "July 2017" "31.07.2017" "Latest"
download 3 "asgs_2017_vol_3_aust_gpkg.zip" "C2168B0401ABACF6CA25816B0013684D" "July 2017" "31.07.2017" "Latest"
download 3 "ced_2017_aust_shp.zip" "9C2197D75933022ACA2581C9001CCF70" "July 2017" "31.10.2017" "Latest"
download 3 "sed_2017_aust_shp.zip" "A5B699CFA332A427CA2581C9001CD88E" "July 2017" "31.10.2017" "Latest"
download 3 "ced_2017_aust_tb_rcd.zip" "13BB308151F1A52ACA2581C9001CE17C" "July 2017" "31.10.2017" "Latest"
download 3 "sed_2017_aust_tb_rcd.zip" "DD973E85A88CCD57CA2581C9001CE1AB" "July 2017" "31.10.2017" "Latest"
download 3 "lga_2017_aust_tb_rcd.zip" "DDD4CEA95664A23BCA2581C9001CE1DA" "July 2017" "31.10.2017" "Latest"


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





download 4 "ucl_2016_aust_csv.zip" "B17E0CCC36197A44CA2581B1000E0914" "July 2016" "09.10.2017" "Latest"
download 4 "sa1_ucl_sosr_sos_2016_aust_csv.zip" "EE5F4698A91AD2F8CA2581B1000E09B0" "July 2016" "09.10.2017" "Latest"
download 4 "sua_2016_aust_csv.zip" "06739F6BDEE5A9D0CA2581B1000E0A05" "July 2016" "09.10.2017" "Latest"
download 4 "sa2_sua_2016_aust_csv.zip" "D6E51168BD6DC248CA2581B1000E0A48" "July 2016" "09.10.2017" "Latest"
download 4 "ucl_association_2011_2016_csv.zip" "5ED0E10A7F36BCD2CA2581B1000E0A75" "July 2016" "09.10.2017" "Latest"
download 4 "sua_association_2011_2016_csv.zip" "9208F31D0501E9D3CA2581B1000E0AA3" "July 2016" "09.10.2017" "Latest"
download 4 "ucl_2016_aust_shape.zip" "F79B919DD05C50DBCA2581B1000E0AD6" "July 2016" "09.10.2017" "Latest"
download 4 "sosr_2016_aust_shape.zip" "641DAEFCCD62AD38CA2581B1000E0EBB" "July 2016" "09.10.2017" "Latest"
download 4 "sos_2016_aust_shape.zip" "9CF74264C4173008CA2581B1000E124F" "July 2016" "09.10.2017" "Latest"
download 4 "sua_2016_aust_shape.zip" "1E24D1FB300696D2CA2581B1000E15A5" "July 2016" "09.10.2017" "Latest"



# ASGS Volume 5
# ABS Publication: 1270.0.55.005
download 5 "ra_2011_aust.zip" "2F6D222C94BC11F7CA257B03000D6DDC" "July 2011" "31.01.2013" "Latest"
download 5 "sa1_2011_ra_2011_aust.zip" "90EDF571EC21BFA0CA257B03000D6E73" "July 2011" "31.01.2013" "Latest"
download 5 "ra_2001_aust_shape.zip" "C712776994895856CA257B03000D7599" "July 2011" "31.01.2013" "Latest"





download 5 "ra_2016_aust_csv.zip" "F996E7BF2B99079FCA258251000C7F6C" "July 2016" "16.03.2018" "Latest"
download 5 "ra_2016_aust_shape.zip" "ACAA23F3B41FA7DFCA258251000C8004" "July 2016" "16.03.2018" "Latest"
download 5 "ra_2016_aust_gpkg.zip" "904192D3B43F6B0ACA258251000C8855" "July 2016" "16.03.2018" "Latest"
download 5 "cg_ra_2011_ra_2016.zip" "3C8C4EBD8D24418BCA258251000C8BC3" "July 2016" "16.03.2018" "Latest"
download 5 "cg_loc_2017_ra_2016.zip" "6F58E33D35FBA034CA258251000C8BEA" "July 2016" "16.03.2018" "Latest"
download 5 "cg_postcode_2017_ra_2016.zip" "14E68CB22C937EBCCA258251000C8C1B" "July 2016" "16.03.2018" "Latest"
download 5 "ra_2016_aust_pdf.zip" "1578649ABB4C0E89CA258251000C8C40" "July 2016" "16.03.2018" "Latest"



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








