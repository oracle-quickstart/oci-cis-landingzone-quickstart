# Getting Object Storage Namespace
data "oci_objectstorage_namespace" "bucket_namespace" {

    #Optional
    compartment_id = var.tenancy_ocid
}

# Creates a buckets from a map where the key is the bucket name
resource "oci_objectstorage_bucket" "these" {
    for_each = var.buckets
        namespace = data.oci_objectstorage_namespace.bucket_namespace.namespace 
        name             = each.key
        compartment_id   = each.value.compartment_id
        kms_key_id       = var.kms_key_id
}
