  <aside class="main-sidebar">
   
    <section class="sidebar">

      <ul class="sidebar-menu">
        <li class="header">LIVE MOD PRO</li>    
        
        <li class="treeview {{'active' if defined('livemodpro') else ''}}">
            <a href="#">
                <span>Device</span>
                <i class="fa fa-angle-left pull-right"></i>
            </a>  
                
            <ul class="treeview-menu">
                <li {{!'class="active"' if defined('deviceSettings') else ''}}>
                    <a href="/device">
                        <span>Settings</span>
                    </a> 
                </li>
                <li {{!'class="active"' if defined('firmware') else ''}}>
                    <a href="/upgrade">
                        <span>Firmware</span>
                    </a>  
                </li>     
                <li {{!'class="active"' if defined('glasses') else ''}}>
                    <a href="/glasses">
                        <span>Glasses</span>
                    </a>  
                </li>      
            </ul> 
        </li>  
        
        <li class="treeview {{'active' if defined('network') else ''}}">
            <a href="#">
                <span>Networking</span>
                <i class="fa fa-angle-left pull-right"></i>
            </a>  
                
            <ul class="treeview-menu">
                <li {{!'class="active"' if defined('networkSettings') else ''}}>
                    <a href="/network_settings">
                        <span>Settings</span>
                    </a>  
                </li>
                <li {{!'class="active"' if defined('connect') else ''}}>
                    <a href="/network_connect">
                        <span>Connect</span>
                    </a> 
                </li>
                <li {{!'class="active"' if defined('enterprise') else ''}}>
                    <a href="/enterpriseNetwork">
                        <span>Enterprise</span>
                    </a> 
                </li> 
                <li class="treeview {{'active' if defined('nettool') else ''}}">
                    <a href="#">
                        <span>Analysis</span>
                        <i class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                        <li {{!'class="active"' if defined('tcpdump') else ''}}>
                            <a href="/network/tcpdump">
                                <span>TCP Dump</span>
                            </a>  
                        </li>  
                        <li {{!'class="active"' if defined('traceroute') else ''}}>
                            <a href="/network/traceroute">
                                <span>Traceroute</span>
                            </a> 
                        </li>  
                        
                    </ul>
                </li>
            </ul> 
        </li>  
        
        <li class="treeview {{'active' if defined('licensing') else ''}}">
            <a href="#">
                <span>Licensing</span>
                <i class="fa fa-angle-left pull-right"></i>
            </a>  
                
            <ul class="treeview-menu">
                <li {{!'class="active"' if defined('license') else ''}}>
                    <a href="/license">
                        <span>Licensing</span>
                    </a>  
                </li>                
            </ul> 
        </li>  
        
        <li class="treeview {{'active' if defined('applications') else ''}}">
            <a href="#">
                <span>Applications</span>
                <i class="fa fa-angle-left pull-right"></i>
            </a>  
           
            <ul class="treeview-menu">
                <li {{!'class="active"' if defined('appOverview') else ''}}>
                    <a href="/applications">
                        <span>Overview</span>
                    </a>  
                </li>    
                
                <li {{!'class="active"' if defined('pivotsip') else ''}}>
                    <a href="/PivotSIP">
                        <span>PivotSIP</span>
                    </a>  
                </li>
                
                <li {{!'class="active"' if defined('pivotvision') else ''}}>
                    <a href="/PivotVision">
                        <span>PivotVision</span>
                    </a>  
                </li>
            </ul>
        </li>  
      </ul>
      
    </section>
   
  </aside>