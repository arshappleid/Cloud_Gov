### Zero Downtime Deployment

```
resource "aws_resource" "name"{
	... Resource Attributes
	lifecyle{
		create_before_destroy = true
	}
}
```

This ensures that the new resources are created first , before deleted the old ones . If new ones are expected to be created after using `` terraform apply`` .
