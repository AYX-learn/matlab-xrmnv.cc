clc;
clear;

html=fileread('bookmarks_2022_10_20.txt');%书签txt文件
site='\w{5,7}.\d{4}.\d{8,9}';

ddd=regexpi(html,site ,'match');
ddd=ddd';

for iii=1:35%收藏数量
    number=string(ddd(iii,1));;
    url='https://www.xrmnw.cc/'+number+'.html';
    sourcefile=webread(url);
    pic='uploadfile\/\d{6}\/\d{1,2}\/\w{9,11}\.jpg';
    page=number+'\_\d{1,2}\.html';
    a=regexp(sourcefile, pic, 'match');
    a=a';
    b=regexp(sourcefile, page, 'match');
    b=b';
    N=size(b,1);
    d(:,1)=a;
    for i=1:N-1
        url2='https://www.xrmnw.cc/'+number+'_'+i+".html";
        page2=webread(url2);
        c=regexp(page2, pic, 'match');
        c=c';
        sz=size(c,1);
        if sz<3
            for i2=sz+1:3
                c(i2,1)={"0"};
                c(i2,2)={"0"};
            end
        end
        for i4=1:sz
            picn(i4,1)=c(i4,1);
            c(i4,2)=c(i4,1);
            c(i4,1)={'https://www.xrmnw.cc/'};
        end
        c=string(c);
        c=join(c,'');
        for i5=1:sz
            str= string(picn(i5,1));
            picurl= c(i5,1);
            picname = extractAfter(str,23);
            outpic = websave(picname,picurl);
        end
    end
    
end






