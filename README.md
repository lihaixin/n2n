# n2n-vpn-docker

![alt tag](https://camo.githubusercontent.com/f35cee935830315c180ec86e8b0e551fbde2434b/68747470733a2f2f7765622e617263686976652e6f72672f7765622f3230313130393234303833303435696d5f2f687474703a2f2f7777772e6e746f702e6f72672f77702d636f6e74656e742f75706c6f6164732f323031312f30382f6e326e5f6e6574776f726b2e706e67)

![alt tag](https://camo.githubusercontent.com/e349c419b59d29e2d196ea3317f73582232cc65f/68747470733a2f2f7765622e617263686976652e6f72672f7765622f3230313130393234303833303435696d5f2f687474703a2f2f7777772e6e746f702e6f72672f77702d636f6e74656e742f75706c6f6164732f323031312f30382f6e326e5f636f6d2e706e67)

# start supernode

     docker run -d -p 61099:61099/udp --name n2n_supernode -e tpye=supernode lihaixin/n2n

# start edge

//node IP 10.9.9.1

     docker run -d --privileged --net=host --name n2n_edge -e type=edge -e interfaceaddress=10.9.9.1 -e supernodenet=192.168.3.108:61099 lihaixin/n2n 
    
//node IP 10.9.9.2

     docker run -d --privileged --net=host --name n2n_edge -e type=edge -e interfaceaddress=10.9.9.2 -e supernodenet=192.168.3.108:61099 lihaixin/n2n



test: ping -f -l 8 -s 800 -c 10000 <far_edge>
