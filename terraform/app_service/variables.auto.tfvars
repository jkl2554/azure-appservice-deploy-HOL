rg_name="app_service-rg"
location="korea central"
asp_name="test-plan"
asp_tier="PremiumV2"
asp_size="P1v2"
app_service_name="hyugoapptest"
app_settings={
    "ASPNETCORE_ENVIRONMENT" = "Production"
}


scm_type = "LocalGit"

connection_strings=[]