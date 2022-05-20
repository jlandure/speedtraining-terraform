/**
* Create the VPC
**/
resource "google_compute_network" "vpc" {
  name                    = "${var.name_prefix}-vpc"
  auto_create_subnetworks = false
}

/**
* Create the Subnet
**/
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.name_prefix}-subnet"
  network       = google_compute_network.vpc.name
  ip_cidr_range = cidrsubnet(var.vpc_cidr, 8, 1) # exemple: cidrsubnet(10.0.0.0/16, 8, 1) -> 10.0.1.0/24
}

/**
* NAT config
**/
resource "google_compute_router" "nat-router" {
  name    = "${var.name_prefix}-nat-router"
  network = google_compute_network.vpc.name
}

resource "google_compute_router_nat" "nat-config" {
  name                               = "${var.name_prefix}-nat-config"
  router                             = google_compute_router.nat-router.name
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
