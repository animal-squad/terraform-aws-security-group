/*
  공통 사항
*/

variable "name_prefix" {
  description = "security group 구성 요소들의 이름과 tag을 선언하는데 사용될 prefix."
  type        = string

  validation {
    condition     = length(var.name_prefix) <= 50
    error_message = "이름에 사용될 prefix는 50자를 넘을 수 없습니다."
  }
}

/*
  보안 그룹
*/

variable "vpc_id" {
  description = "security group을 생성 할 vpc의 id"
  type        = string
}

variable "ingress_rules" {
  description = "ingress 규칙 목록. key 값은 규칙의 이름에 사용됩니다."

  type = map(object({
    from_port   = number
    to_port     = number
    ip_protocol = string
    cidr_ipv4   = optional(string, null)
    ref_sg_id   = optional(string, null)
  }))

  default = {}
}
