function line_objects = flippy_animation
    % add aditional custom constraints
      
    
    
    shoulder_link = flippy.Links(getLinkIndices(flippy, 'shoulder_link'));
    shoulder_frame = shoulder_link.Reference;
    
    shoulder = CoordinateFrame(...
        'Name','Shoulder',...
        'Reference',shoulder_frame,...
        'Offset',[0, 0, 0],...
        'R',[0,0,0]... % z-axis is the normal axis, so no rotation required
        );
    p_shoulder = getCartesianPosition(flippy,shoulder);
    
    upper_arm_link = flippy.Links(getLinkIndices(flippy, 'upper_arm_link'));
    upper_arm_frame = upper_arm_link.Reference;

    upperarm = CoordinateFrame(...
        'Name','UpperArm',...
        'Reference',upper_arm_frame,...
        'Offset',[0, 0, 0],...
        'R',[0,0,0]... % z-axis is the normal axis, so no rotation required
        );
    p_upperarm = getCartesianPosition(flippy,upperarm);
    
    forearm_link = flippy.Links(getLinkIndices(flippy, 'forearm_link'));
    forearm_frame = forearm_link.Reference;

    forearm = CoordinateFrame(...
        'Name','ForeArm',...
        'Reference',forearm_frame,...
        'Offset',[0, 0, 0],...
        'R',[0,0,0]... % z-axis is the normal axis, so no rotation required
        );
    p_forearm = getCartesianPosition(flippy,forearm);
    
    wrist_1_link = flippy.Links(getLinkIndices(flippy, 'wrist_1_link'));
    wrist_1_frame = wrist_1_link.Reference;

    wrist1 = CoordinateFrame(...
        'Name','Wrist1',...
        'Reference',wrist_1_frame,...
        'Offset',[0, 0, 0],...
        'R',[0,0,0]... % z-axis is the normal axis, so no rotation required
        );
    p_wrist1 = getCartesianPosition(flippy,wrist1);
    
    wrist_2_link = flippy.Links(getLinkIndices(flippy, 'wrist_2_link'));
    wrist_2_frame = wrist_2_link.Reference;

    wrist2 = CoordinateFrame(...
        'Name','Wrist2',...
        'Reference',wrist_2_frame,...
        'Offset',[0, 0, 0],...
        'R',[0,0,0]... % z-axis is the normal axis, so no rotation required
        );
    p_wrist2 = getCartesianPosition(flippy,wrist2);
    
    wrist_3_link = flippy.Links(getLinkIndices(flippy, 'wrist_3_link'));
    wrist_3_frame = wrist_3_link.Reference;

    wrist3 = CoordinateFrame(...
        'Name','Wrist3',...
        'Reference',wrist_3_frame,...
        'Offset',[0, 0, 0],...
        'R',[0,0,0]... % z-axis is the normal axis, so no rotation required
        );
    p_wrist3 = getCartesianPosition(flippy,wrist3);
    
    
    
    ur5_arm = KinematicGroup('Name','UR5Arm','AllowDuplicate',true);

    ur5_arm = ur5_arm.addKinematic(...
                {p_shoulder(1),p_shoulder(2),p_shoulder(3),...
                p_upperarm(1),p_upperarm(2),p_upperarm(3),...
                p_forearm(1),p_forearm(2),p_forearm(3),...
                p_wrist1(1),p_wrist1(2),p_wrist1(3),...
                p_wrist2(1),p_wrist2(2),p_wrist2(3),...
                p_wrist3(1),p_wrist3(2),p_wrist3(3)});

            line_objects.Kin = ur5_arm;
            line_objects.Color = 'r';
            line_objects.Style = '-o';
            line_objects.LineWidth = 6;
            line_objects.MarkerSize = 4;
            line_objects.NumPoint = 6;
 
%             obj  = line_objects;
    
end