function real_Z=generation_of_real_zmatrix_for_any_size_pixels2(pixels) %N*N pixels (Keep this number odd)
%% initialization port and physical positions

% pixels=39; % N*N pixels (Keep this number odd)
Lastport=pixels^2+2*pixels*(pixels-1);
x_set1=-(pixels-2)/2:1:(pixels-2)/2;
y_set1=-(pixels-1)/2:(pixels-1)/2;
x_set2=-(pixels-1)/2:(pixels-1)/2;
y_set2=-(pixels-2)/2:1:(pixels-2)/2;
x_set3=-(pixels-1)/2:(pixels-1)/2;
y_set3=-(pixels-1)/2:(pixels-1)/2;
coordinate=[];
count=0;
for m=1:length(y_set1)
    for n=1:length(x_set1)
        count=count+1;
        x=x_set1(n);
        y=y_set1(m);
        coordinate=[coordinate; x y count x-min(x_set1) max(x_set1)-x y-min(y_set1) max(y_set1)-y];
    end
end
set1=count;
for n=1:length(x_set2)
    for m=1:length(y_set2)
        count=count+1;
        x=x_set2(n);
        y=y_set2(m);
        coordinate=[coordinate; x y count x-min(x_set2) max(x_set2)-x y-min(y_set2) max(y_set2)-y];
    end
end
set2=count;
for m=1:length(y_set3)
    for n=1:length(x_set3)
        count=count+1;
        x=x_set3(n);
        y=y_set3(m);
        coordinate=[coordinate; x y count x-min(x_set3) max(x_set3)-x y-min(y_set3) max(y_set3)-y];
    end
end
set3=count;
%eg. 29*29pixels: 1:812 xH, 813:1624 yH, 1625:2465 V
coordinate(:,1:2)=coordinate(:,1:2)*12;
maping_matrix=coordinate;
set1_index=1:set1;
set2_index=set1+1:set2;
set3_index=set2+1:set3;

real_Z=zeros(set3,set3);
%% loading original data ana mapping
s_p=load("s10325p_s2G3_2G5_5pts_all");
s_params=s_p.s10325p_2G4;
z_params_original=s2z(s_params,50);
pixels1=59; % N*N pixels (Keep this number odd)
Lastport=pixels1^2+2*pixels1*(pixels1-1);
x_set1=-(pixels1-2)/2:1:(pixels1-2)/2;
y_set1=-(pixels1-1)/2:(pixels1-1)/2;
x_set2=-(pixels1-1)/2:(pixels1-1)/2;
y_set2=-(pixels1-2)/2:1:(pixels1-2)/2;
x_set3=-(pixels1-1)/2:(pixels1-1)/2;
y_set3=-(pixels1-1)/2:(pixels1-1)/2;
coordinate=[];
count=0;
for m=1:length(y_set1)
    for n=1:length(x_set1)
        count=count+1;
        x=x_set1(n);
        y=y_set1(m);
        coordinate=[coordinate; x y count x-min(x_set1) max(x_set1)-x y-min(y_set1) max(y_set1)-y];
    end
end
set1=count;
for n=1:length(x_set2)
    for m=1:length(y_set2)
        count=count+1;
        x=x_set2(n);
        y=y_set2(m);
        coordinate=[coordinate; x y count x-min(x_set2) max(x_set2)-x y-min(y_set2) max(y_set2)-y];
    end
end
set2=count;
for m=1:length(y_set3)
    for n=1:length(x_set3)
        count=count+1;
        x=x_set3(n);
        y=y_set3(m);
        coordinate=[coordinate; x y count x-min(x_set3) max(x_set3)-x y-min(y_set3) max(y_set3)-y];
    end
end
set3=count;
%eg. 29*29pixels: 1:812 xH, 813:1624 yH, 1625:2465 V
coordinate(:,1:2)=coordinate(:,1:2)*12;
maping_matrix_original=coordinate;
set1_index_original=1:set1;
set2_index_original=set1+1:set2;
set3_index_original=set2+1:set3;


%% Port mapping
Map_port=[];
for i=set1_index
    if maping_matrix(i,4)<=maping_matrix(i,5)
        distancex_index=4;
    else
        distancex_index=5;
    end
    if maping_matrix(i,6)<=maping_matrix(i,7)
        distancey_index=6;
    else
        distancey_index=7;
    end
    index_error=[];
    for index1=set1_index_original
        if  maping_matrix_original(index1,distancex_index)==min( maping_matrix_original(index1,[4,5]))
            if maping_matrix_original(index1,distancey_index)==min( maping_matrix_original(index1,[6,7]))
                error=abs(maping_matrix_original(index1,distancex_index)-maping_matrix(i,distancex_index))+...
                    abs(maping_matrix_original(index1,distancey_index)-maping_matrix(i,distancey_index));
                index_error=[index_error; index1 error];
            end
        end
    end
    [~,tem]=min(index_error(:,2));
    Map_port=[Map_port;i, index_error(tem,1)];
    index_error=[];
end

for i=set2_index
    if maping_matrix(i,4)<=maping_matrix(i,5)
        distancex_index=4;
    else
        distancex_index=5;
    end
    if maping_matrix(i,6)<=maping_matrix(i,7)
        distancey_index=6;
    else
        distancey_index=7;
    end
    index_error=[];
    for index1=set2_index_original
        if  maping_matrix_original(index1,distancex_index)==min( maping_matrix_original(index1,[4,5]))
            if maping_matrix_original(index1,distancey_index)==min( maping_matrix_original(index1,[6,7]))
                error=abs(maping_matrix_original(index1,distancex_index)-maping_matrix(i,distancex_index))+...
                    abs(maping_matrix_original(index1,distancey_index)-maping_matrix(i,distancey_index));
                index_error=[index_error; index1 error];
            end
        end
    end
    [~,tem]=min(index_error(:,2));
    Map_port=[Map_port;i, index_error(tem,1)];
    index_error=[];
end

for i=set3_index
    if maping_matrix(i,4)<=maping_matrix(i,5)
        distancex_index=4;
    else
        distancex_index=5;
    end
    if maping_matrix(i,6)<=maping_matrix(i,7)
        distancey_index=6;
    else
        distancey_index=7;
    end
    index_error=[];
    for index1=set3_index_original
        if  maping_matrix_original(index1,distancex_index)==min( maping_matrix_original(index1,[4,5]))
            if maping_matrix_original(index1,distancey_index)==min( maping_matrix_original(index1,[6,7]))
                error=abs(maping_matrix_original(index1,distancex_index)-maping_matrix(i,distancex_index))+...
                    abs(maping_matrix_original(index1,distancey_index)-maping_matrix(i,distancey_index));
                index_error=[index_error; index1 error];
            end
        end
    end
    [~,tem]=min(index_error(:,2));
    Map_port=[Map_port;i, index_error(tem,1)];
    index_error=[];
end


%% self impedance
for i=1:length(Map_port(:,1))
    real_Z(Map_port(i,1),Map_port(i,1))=real(z_params_original(Map_port(i,2),Map_port(i,2)));
end

%% mutual impedance inside set1
for i=set1_index
    for j=set1_index
        if i==j
            continue
        end
        mapped_index=Map_port(i,2);
        positionx=maping_matrix_original(mapped_index,1)+maping_matrix(j,1)-maping_matrix(i,1);
        positiony=maping_matrix_original(mapped_index,2)+maping_matrix(j,2)-maping_matrix(i,2);
        for ii=set1_index_original
            tem=-1;
            if maping_matrix_original(ii,1)==positionx && maping_matrix_original(ii,2)==positiony
                tem=ii;
                break;
            end
        end
        if tem==-1
            real_Z(i,j)=0;
        else
            real_Z(i,j)=real(z_params_original(mapped_index,ii));
        end
    end
end
%% mutual impedance inside set2
for i=set2_index
    for j=set2_index
        if i==j
            continue
        end
        mapped_index=Map_port(i,2);
        positionx=maping_matrix_original(mapped_index,1)+maping_matrix(j,1)-maping_matrix(i,1);
        positiony=maping_matrix_original(mapped_index,2)+maping_matrix(j,2)-maping_matrix(i,2);
        for ii=set2_index_original
            tem=-1;
            if maping_matrix_original(ii,1)==positionx && maping_matrix_original(ii,2)==positiony
                tem=ii;
                break;
            end
        end
        if tem==-1
            real_Z(i,j)=0;
        else
            real_Z(i,j)=real(z_params_original(mapped_index,ii));
        end
    end
end

%% mutual impedance between set1 and set2
for i=set1_index
    for j=set2_index
        if i==j
            continue
        end
        mapped_index=Map_port(i,2);
        positionx=maping_matrix_original(mapped_index,1)+maping_matrix(j,1)-maping_matrix(i,1);
        positiony=maping_matrix_original(mapped_index,2)+maping_matrix(j,2)-maping_matrix(i,2);
        for ii=set2_index_original
            tem=-1;
            if maping_matrix_original(ii,1)==positionx && maping_matrix_original(ii,2)==positiony
                tem=ii;
                break;
            end
        end
        if tem==-1
            real_Z(i,j)=0;
        else
            real_Z(i,j)=real(z_params_original(mapped_index,ii));
        end
    end
end

%% mutual impedance between set1 and set3
for i=set1_index
    for j=set3_index
        if i==j
            continue
        end
        mapped_index=Map_port(i,2);
        positionx=maping_matrix_original(mapped_index,1)+maping_matrix(j,1)-maping_matrix(i,1);
        positiony=maping_matrix_original(mapped_index,2)+maping_matrix(j,2)-maping_matrix(i,2);
        for ii=set3_index_original
            tem=-1;
            if maping_matrix_original(ii,1)==positionx && maping_matrix_original(ii,2)==positiony
                tem=ii;
                break;
            end
        end
        if tem==-1
            real_Z(i,j)=0;
        else
            real_Z(i,j)=real(z_params_original(mapped_index,ii));
        end
    end
end

%% mutual impedance between set2 and set1
for i=set2_index
    for j=set1_index
        if i==j
            continue
        end
        mapped_index=Map_port(i,2);
        positionx=maping_matrix_original(mapped_index,1)+maping_matrix(j,1)-maping_matrix(i,1);
        positiony=maping_matrix_original(mapped_index,2)+maping_matrix(j,2)-maping_matrix(i,2);
        for ii=set1_index_original
            tem=-1;
            if maping_matrix_original(ii,1)==positionx && maping_matrix_original(ii,2)==positiony
                tem=ii;
                break;
            end
        end
        if tem==-1
            real_Z(i,j)=0;
        else
            real_Z(i,j)=real(z_params_original(mapped_index,ii));
        end
    end
end

%% mutual impedance between set2 and set3
for i=set2_index
    for j=set3_index
        if i==j
            continue
        end
        mapped_index=Map_port(i,2);
        positionx=maping_matrix_original(mapped_index,1)+maping_matrix(j,1)-maping_matrix(i,1);
        positiony=maping_matrix_original(mapped_index,2)+maping_matrix(j,2)-maping_matrix(i,2);
        for ii=set3_index_original
            tem=-1;
            if maping_matrix_original(ii,1)==positionx && maping_matrix_original(ii,2)==positiony
                tem=ii;
                break;
            end
        end
        if tem==-1
            real_Z(i,j)=0;
        else
            real_Z(i,j)=real(z_params_original(mapped_index,ii));
        end
    end
end

%% mutual impedance between set3 and set1
for i=set3_index
    for j=set1_index
        if i==j
            continue
        end
        mapped_index=Map_port(i,2);
        positionx=maping_matrix_original(mapped_index,1)+maping_matrix(j,1)-maping_matrix(i,1);
        positiony=maping_matrix_original(mapped_index,2)+maping_matrix(j,2)-maping_matrix(i,2);
        for ii=set1_index_original
            tem=-1;
            if maping_matrix_original(ii,1)==positionx && maping_matrix_original(ii,2)==positiony
                tem=ii;
                break;
            end
        end
        if tem==-1
            real_Z(i,j)=0;
        else
            real_Z(i,j)=real(z_params_original(mapped_index,ii));
        end
    end
end

%% mutual impedance between set3 and set2
for i=set3_index
    for j=set2_index
        if i==j
            continue
        end
        mapped_index=Map_port(i,2);
        positionx=maping_matrix_original(mapped_index,1)+maping_matrix(j,1)-maping_matrix(i,1);
        positiony=maping_matrix_original(mapped_index,2)+maping_matrix(j,2)-maping_matrix(i,2);
        for ii=set2_index_original
            tem=-1;
            if maping_matrix_original(ii,1)==positionx && maping_matrix_original(ii,2)==positiony
                tem=ii;
                break;
            end
        end
        if tem==-1
            real_Z(i,j)=0;
        else
            real_Z(i,j)=real(z_params_original(mapped_index,ii));
        end
    end
end

%% mutual impedance between set3 and set3
for i=set3_index
    pixels+(i-set3_index(1))/length(set3_index)
    data_veritcal_z=[];
    for ii=Map_port(i,2)
        for jj=set3_index_original
            if ii==jj
                continue
            end
            distancex=abs(maping_matrix_original(ii,1)-maping_matrix_original(jj,1));
            distancey=abs(maping_matrix_original(ii,2)-maping_matrix_original(jj,2));
            distance=sqrt(distancex.^2+distancey.^2);
            data_veritcal_z=[data_veritcal_z; distance real(z_params_original(ii,jj)) real(z_params_original(ii,jj))/sqrt(real(z_params_original(jj,jj))*real(z_params_original(ii,ii)))];
        end
    end
    for ii=length(data_veritcal_z):-1:1
        if data_veritcal_z(ii,1)<=0
            data_veritcal_z(ii,:)=[];
        end
    end
    a=25*20;
    b=20;
    c=0.0485;
    d=-26;
    e=0;
    ft = fittype( 'vericalz( x, a, b, c, d, e)' );
    f = fit( data_veritcal_z(:,1),data_veritcal_z(:,2), ft, 'StartPoint', [500 -30 0.0485 -36 0] );
    maxdistance=max(data_veritcal_z(:,1));
    % plot( f,data_veritcal_z(:,1),data_veritcal_z(:,2) )
    % legend("original data","fitting line")

    for j=set3_index
        if i==j
            continue
        end

        distance=sqrt( (maping_matrix(j,1)-maping_matrix(i,1)).^2+(maping_matrix(j,2)-maping_matrix(i,2)).^2);

        mapped_index=Map_port(i,2);
        positionx=maping_matrix_original(mapped_index,1)+maping_matrix(j,1)-maping_matrix(i,1);
        positiony=maping_matrix_original(mapped_index,2)+maping_matrix(j,2)-maping_matrix(i,2);
        for ii=set3_index_original
            tem=-1;
            if maping_matrix_original(ii,1)==positionx && maping_matrix_original(ii,2)==positiony
                tem=ii;
                break;
            end
        end

        if tem~=-1
                real_Z(i,j)=real(z_params_original(mapped_index,ii));
                real_Z(j,i)=real(z_params_original(mapped_index,ii));

        else
            real_Z(i,j)=vericalz( distance, f.a, f.b, f.c, f.d, f.e);
            real_Z(j,i)=vericalz( distance, f.a, f.b, f.c, f.d, f.e);
        end

        % elseif min(maping_matrix(i,[4 5 6 7]))<=min(maping_matrix(j,[4 5 6 7]))


    end
end
end

