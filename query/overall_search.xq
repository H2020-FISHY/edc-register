let $nsfs :=  doc("/srv/basex/db_files/NSFCatalogue.xml")//nSF
return ("Available NSFs: ", $nsfs/@id/data()), 
let $condition_capa := doc("/srv/basex/db_files/NSFCatalogue.xml")//nSF/securityCapability[contains(@ref, "Condition")]/@ref/data()
return ("&#xa;Condition SecurityCapability available: ", $condition_capa), let $condition_capa := doc("/srv/basex/db_files/NSFCatalogue.xml")//nSF/securityCapability[contains(@ref, "Action")]/@ref/data()
return ("&#xa;Action SecurityCapability available: ", $condition_capa)
