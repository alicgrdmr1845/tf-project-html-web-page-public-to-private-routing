## Testing managing network traffic targeting Azure virtual machines in the hub and spoke network topology with using app gateway & load balancer for traffic routing.
This project is done with using both terraform and azure portal.Since the files are too big, they are pushed to github with lfs (large file storage) push.

Task 1: Provision the lab environment

![lab08 (1)](https://user-images.githubusercontent.com/95598307/225375371-9e30e4a3-0c2d-475c-8e37-c630bf8073e3.png)

Task 2: Configure the hub and spoke network topology
To complate this task, we should create network manager group for spoke group (vnet2 and vnet3 ) and arrange the connectivity between hub (vnet1 ). Also we need virtual network gateway for connectivity

![network manager](https://user-images.githubusercontent.com/95598307/225377087-34e54080-d299-456a-9d47-723a1cac441f.png)
![vnetgateway](https://user-images.githubusercontent.com/95598307/225377161-1a8c6a81-2a97-4f8d-b275-0fea381c05ee.png)

Task 3: Configure routing with using route tables

![route-2to3](https://user-images.githubusercontent.com/95598307/225377644-5e4705cc-46e8-49f3-a139-536574852cc1.png)
	
Task 4: Implement Azure Load Balancer

![load-balancer](https://user-images.githubusercontent.com/95598307/225378776-ed38cfaa-c394-49d1-bbe2-fee946a4a09c.png)

Task 5: Implement Azure Application Gateway

![app-gw](https://user-images.githubusercontent.com/95598307/225378837-c0e3e91c-c878-4ad9-9378-23c830389398.png)

Also you can find this tasks in terraform file with more details

![terraform project view](https://user-images.githubusercontent.com/95598307/225378215-1d2b37c1-b02b-4f3f-b75f-ee8b6f11b769.png)

Lastly you can check the connection with application gateway public ip. As you know application gateway is working with layer 7 so it will work with url based routing. We connected application gateway with image pool.

![connecting image server with app gateway](https://user-images.githubusercontent.com/95598307/225378594-201249be-550a-4eb1-8a94-3da0143c6ef7.png)

You can find the necessary architecture information from the topology view.

![topology-1](https://user-images.githubusercontent.com/95598307/225379094-fc0ea2b7-55d3-4021-9104-4cc0a333d049.png)

