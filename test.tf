variable "lb_id" {
  # default = []
  default = ["243"]
}
variable "s3_id"{
  # default = []
  default = ["s3-1"]
}

variable "ec2_id"{
  # default = []
  default = ["ec2-1"]
}


locals {
  alb_alarm = [{
    key="cpuulization" 
    value = "123"}
  # },
  # {
  #   key="Artificiall Intelligence"
  #   value= "Iron Man"
  # }
  ]
  s3=[{
        key="cpuulization" 
        value = "123"
  }]
  ec2=[{
        key="cpuulization" 
        value = "123"
  }]
  test= concat(flatten([for rds in local.alb_alarm:[for id in var.lb_id:{
  ke=rds.key
  va=rds.value
  sid=id
 }]]),flatten([for rds in local.s3:[for id in var.s3_id:{
  ke=rds.key
  va=rds.value
  sid=id
 }]]),
 flatten([for rds in local.ec2:[for id in var.ec2_id:{
  ke=rds.key
  va=rds.value
  sid=id
 }]]))
  # alb_arn= 
  # alarm_s3 = {
  #   "Spider Man"      = "Web"
  #   "Black Panther"   = "Vibranium suit"
  # }
#  test= concat(distinct(flatten([for k,rds in local.strengths:[for id in var.lb_id:{
#   ke=k
#   va=rds
#   sid= {alb=id}
#  }
#   ]])),distinct(flatten([for k,rds in local.alarm_s3:[for id in var.s3_id:{
#   ke=k
#   va=rds
#   sid= var.s3_id
#  }
#   ]])))

test1=tomap({for item in local.test:"${item.ke}-${item.sid}"=>{
  # item
  # ke=item.ke
  # va=item.va
  # sid=item.sid
}})


}
output test {
  value = local.test1
}


# resource "null_resource" "strengths" {
#   for_each = {for id in local.test:"${id.sid}.${id.ke}"=>id}
#   triggers = {
#     name  = "${each.value.ke}-${each.value.sid}"
#     power = "${each.value.va}-${each.value.sid}"
#   }
# }
# output "strengths" {
#   value = null_resource.strengths
# }

# {
#   "source": ["aws.ec2"],
#   "detail-type": ["EC2 Instance State-change Notification"],
#   "detail": {
#     "state": ["pending", "running", "shutting-down", "terminated", "stopping", "stopped"]
#   }
# }