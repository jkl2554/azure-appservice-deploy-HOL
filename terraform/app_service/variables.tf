variable "rg_name"{
    type=string
    default="app_service-rg"
    description="리소스 그룹 이름"
}
variable "location"{
    type=string
    default="korea central"
    description="생성 지역"
}
variable "asp_name"{
    type=string
    default="testplan"
    description="앱 서비스 플랜 이름"
}
variable "asp_tier"{
    type=string
    default="PremiumV2"
    description="티어"
}
variable "asp_size"{
    type=string
    default="P1v2"
    description="사이즈"
}
variable "app_service_name"{
    type=string
    default=""
    description=""
}
variable "app_settings"{
    type=map(string)
    default={
        "ASPNETCORE_ENVIRONMENT" = "Production"
    }
    description="애플리케이션 환경 변수 설정"
}

variable "scm_type"{
    type = string
    default = "None"
    description = "deploymnet config"
}

variable "username"{
    type = string
    default = "app_service_user"
    description = "app service git username"
}
variable "password"{
    type = string
    default = "qwer1234!@#$"
    description = "app service git password"
}
variable "connection_strings"{
    type=list(object({
        name = string
        type = string
        value = string
    }))
    default=[]
    description="데이터베이스 연결 문자열 설정"
}

variable "mysql_in_app"{
    type = bool
    default = true
    description = "Local DB(mysql in app) 설정"
}