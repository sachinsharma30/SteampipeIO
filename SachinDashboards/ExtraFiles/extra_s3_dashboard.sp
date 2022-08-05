dashboard "" {
  title = "Sachin's Dashboard"
    text {
        value = "My S3 Data"
        width = 1
    }
    input "vpc_id" {
        title = "Select S3 Buckets"
        type  = "select"
        width = 2

        sql  = <<-EOQ
            select
                title as label,
                title as value
            from
                aws_s3_bucket;
        EOQ
    }
}


chart {
        title = "Unencrypted Buckets"
        sql = <<-EQQ
            select 
                count(i.*) as "Unencrypted Buckets"
            from
                aws_s3_bucket
            where 
                server_side_encryption_configuration is null
        EOQ
        type = "column"
        width = 4
    }