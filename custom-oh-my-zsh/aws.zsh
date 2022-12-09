ebsdescribe() {
    aws-assume "${1}" \
    aws elasticbeanstalk describe-environment \
        --no-cli-pager \
        --environment-id "${2}" \
        --region "${3}"
}

ebsinfo() {
    aws-assume "${1}" \
    aws elasticbeanstalk retrieve-environment-info \
        --environment-id "${2}" \
        --region "${3}" \
        --info-type "tail"
}

ebsEnvHealth() {
    aws-assume "${1}" \
    aws elasticbeanstalk describe-environment-health \
        --environment-id "${2}" \
        --region "${3}" \
        --attribute-names "All"
}

ebsInstances() {
    aws-assume "${1}" \
    aws elasticbeanstalk describe-instances-health \
        --no-cli-pager \
        --environment-id "${2}" \
        --region "${3}" \
        --attribute-names "HealthStatus"
}

ebsInstanceHealth() {
    aws-assume "${1}" \
    aws elasticbeanstalk describe-instances-health \
        --environment-id "${2}" \
        --region "${3}" \
        --attribute-names "All"
}

ebsInstanceIds() {
    aws-assume "${1}" \
    aws elasticbeanstalk describe-instances-health \
        --no-cli-pager \
        --environment-id "${2}" \
        --region "${3}" \
        --attribute-names "HealthStatus" \
    | jq ".InstanceHealthList[] | objects | .InstanceId" \
    | tr -d '"'
}

ec2InstanceAddresses() {
    aws-assume "${1}" \
    aws ec2 describe-instances \
        --no-cli-pager \
        --region "${3}" \
        --filters "Name='instance-id',Values='${2}'" \
    | jq ".Reservations[] | .Instances[] | .PublicIpAddress" \
    | tr -d '"'
}

ec2Terminate() {
    aws-assume "${1}" \
    aws ec2 terminate-instances \
        --no-cli-pager \
        --region "${3}" \
        --instance-id "${2}"
}

ebsAddresses() {
    for instance in $(ebsInstanceIds "$@")
    do
        echo "${instance}"
        ec2InstanceAddresses "${ENV}" "${instance}" "${region}"
        echo ""
    done
}

function ebscmd() {
    APP="${1}"
    INSTANCE="${1}"
    ENV="${2:-stage}"
    CMD="${3:-describe}"

    case $ENV in
        stage)
            region="${ENV_EBS_STAGE_REGION}"
        ;;
    
        prod)
            region="${ENV_EBS_PROD_REGION}"
        ;;
    esac

    case $CMD in
        describe)
            ebsdescribe $ENV $APP $region
        ;;

        info)
            ebsinfo $ENV $APP $region
        ;;

        env-health)
            ebsEnvHealth $ENV $APP $region
        ;;

        instances)
            ebsInstances $ENV $APP $region
        ;;

        instance-health)
            ebsInstanceHealth $ENV $APP $region
        ;;

        addresses)
            ebsAddresses $ENV $APP $region
        ;;

        terminate)
            ec2Terminate $ENV $INSTANCE $region
        ;;
    esac
}
