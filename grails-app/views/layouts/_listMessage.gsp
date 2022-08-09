<!-- Messages Menu -->
<li class="dropdown messages-menu">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-envelope-o"></i>
        <span class="label label-success">4</span>
    </a>
    <ul class="dropdown-menu">
        <li class="header">You have 4 messages</li>
        <li>
            <!-- inner menu: contains the actual data -->
            <ul class="menu">
                <li>
                    <a href="#">
                        <div class="pull-left">
                            <img src="${resource(dir: "resources/images/user", file: "badiuzzaman.jpg")}" class="img-circle" alt="User Image">
                        </div>
                        <h4>
                            Developers
                            <small><i class="fa fa-clock-o"></i> Yesterday</small>
                        </h4>

                        <p>Why not buy a new awesome theme?</p>
                    </a>
                </li>
                <li><!-- start message -->
                    <a href="#">
                        <div class="pull-left">
                            <img src="${resource(dir: "resources/images/user", file: "saif_khan.jpg")}" class="img-circle" alt="User Image">
                            %{--<img src="${resource(dir: "resources/images/", file: "logo.jpg")}" class="img-circle" alt="User Image">--}%
                            %{--<img src="${applicationContext.springSecurityService?.currentUser?.username == "saif_hmk" ?resource(dir: "resources/images/user", file: "saif_khan.jpg"):(resource(dir: "resources/images/", file: "logo.jpg"))}" class="img-circle" alt="User Image">--}%
                        </div>
                        <h4>
                            AdminLTE Design Team
                            <small><i class="fa fa-clock-o"></i> 5 mins</small>
                        </h4>

                        <p>Why not buy a new awesome theme?</p>
                    </a>
                </li>
                <!-- end message -->
                <li>
                    <a href="#">
                        <div class="pull-left">
                            <img src="${resource(dir: "resources/images/user", file: "anisur_rahman.jpg")}" class="img-circle" alt="User Image">
                        </div>
                        <h4>
                            Sales Department
                            <small><i class="fa fa-clock-o"></i> 2 hours</small>
                        </h4>

                        <p>Why not buy a new awesome theme?</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="pull-left">
                            <img src="${resource(dir: "resources/images/user", file: "asif_mahmud.jpg")}" class="img-circle" alt="User Image">
                        </div>
                        <h4>
                            Support Team
                            <small><i class="fa fa-clock-o"></i> Today</small>
                        </h4>

                        <p>Why not buy a new awesome theme?</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="pull-left">
                            <img src="${resource(dir: "resources/images/user", file: "rajib.jpg")}" class="img-circle" alt="User Image">
                        </div>
                        <h4>
                            Reviewers
                            <small><i class="fa fa-clock-o"></i> 2 days</small>
                        </h4>

                        <p>Why not buy a new awesome theme?</p>
                    </a>
                </li>
            </ul>
        </li>
        <li class="footer"><a href="#">See All Messages</a></li>
    </ul>
</li>