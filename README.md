# JHPullZoomView
tableview,scrollview 下拉放大.
 使用方法:把JHDropHeaderView和UIView的分类 拖到你的项目中,导入头文件,在复制以下代码即可.  
 
    
    1.当头部视图只有一张图片的时候.使用方法如下  
    UIImageView *topView =  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"likaifu"]];  
    topView.frame = CGRectMake(0, 0, self.view.frame.size.width, 250);   
    
    JHDropHeaderView *JHView = [JHDropHeaderView dropHeaderViewWithFrame:topView.frame contentView:topView stretchView:topView];   
    JHView.frame = topView.frame;   
    self.tableView.tableHeaderView = JHView;   
    
    2.当下拉放大的头部视图不只是一张图,还有其他控件,那么需要创建一个view,把需要放大的图片放在view上面即可.   
    
 
     UIImageView *topView =  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"likaifu"]];  
     topView.frame = CGRectMake(0, 0, self.view.frame.size.width, 250);   
     UIView *JHView = [[UIView alloc]init];   
     JHView.frame =CGRectMake(0, 0, self.view.frame.size.width, 250);     
     [JHView addSubview:topView];      
     JHDropHeaderView *JHView = [JHDropHeaderView dropHeaderViewWithFrame:JHView.frame contentView:JHView stretchView:topView];        
