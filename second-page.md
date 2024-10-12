# Example Second Page

This is an example second page that will appear in the Docsify Sidebar.

---

# 2024/10/12

最近研究B站直链，~~浪费大好人生~~ 

下面是两个直链解析站：

```
https://zhouql.vip/bilibili/
https://api.injahow.cn/bparse/
```

这俩返回的都是mp4合并流，而不是常见的dash流（音视频分离），作为外链很好用。

这俩都能实现一个特殊功能，直链能直接播放，而不需要referer。大部分下载工具获得的直链，如果要使用，都需要请求头提供B站主站的referer，但是这俩都不用，很神奇，不知道怎么做到的。

前者得到360p，也就是未登录的画质，后者能得到720p，应该是后台挂着有账号在解析。

值得注意的是，之前b站有两种合并流，或者叫[原生mp4格式](https://github.com/the1812/Bilibili-Evolved/issues/310)，一个是1080p的mp4或更早就是flv（2020以前flv播放器还没下线），一个是360p的flv。最近一两年1080p的那一份改成了720p。至于在flash下线后为什么还要特意提供mp4而不是dash，猜测是用于特殊情况，比如安卓投屏、TV端、车机、老旧设备等不支持dash流的情况。

前者解析`https://www.bilibili.com/video/BV1xE2bYjEvq`得到：

```
https://cn-sdjn-cm-02-12.bilivideo.com/upgcxcode/82/55/26253985582/26253985582-1-16.mp4?e=ig8euxZM2rNcNbRVhwdVhwdlhWdVhwdVhoNvNC8BqJIzNbfq9rVEuxTEnE8L5F6VnEsSTx0vkX8fqJeYTj_lta53NCM=&uipk=5&nbs=1&deadline=1728750865&gen=playurlv2&os=bcache&oi=999925353&trid=0000f1f3369f97f8466799161da7cc70bb07h&mid=0&platform=html5&og=hw&upsig=9d21325161b97361c5507e081831db48&uparams=e,uipk,nbs,deadline,gen,os,oi,trid,mid,platform,og&cdnid=4053&bvc=vod&nettype=0&f=h_0_0&bw=63137&logo=80000000
```

后者请求`https://api.injahow.cn/bparse/?bv=BV1xE2bYjEvq&otype=url`则返回：

```
https://cn-sxxa-ct-03-05.bilivideo.com/upgcxcode/82/55/26253985582/26253985582-1-192.mp4?e=ig8euxZM2rNcNbNB7zdVhwdlhbUahwdVhoNvNC8BqJIzNbfq9rVEuxTEnE8L5F6VnEsSTx0vkX8fqJeYTj_lta53NCM=&uipk=5&nbs=1&deadline=1728744561&gen=playurlv2&os=bcache&oi=1696788563&trid=00005d02af4dbb5d4252bc3f70a3a366a2e7T&mid=37765760&platform=html5&og=hw&upsig=67a06f91bff95609cecb84db42a19ee5&uparams=e,uipk,nbs,deadline,gen,os,oi,trid,mid,platform,og&cdnid=63305&bvc=vod&nettype=0&bw=257602&orderid=0,1&buvid=&build=0&mobi_app=&f=T_0_0&logo=80000000
```

可以看到一些有意思的信息，比如前者mid=0意味着没有登录，后者mid=37765760则暴露了b站uid；前者cdn为sdjn意为山东济南，后者sxxa应该是陕西西安，也暴露了解析站服务器地理位置。

如果自己去解析（比如使用Bilibili Evolved）：

```
https://upos-sz-mirrorbd.bilivideo.com/upgcxcode/82/55/26253985582/26253985582-1-192.mp4?e=ig8euxZM2rNcNbNB7zdVhwdlhbUahwdVhoNvNC8BqJIzNbfqXBvEqxTEto8BTrNvN0GvT90W5JZMkX_YN0MvXg8gNEV4NC8xNEV4N03eN0B5tZlqNxTEto8BTrNvNeZVuJ10Kj_g2UB02J0mN0B5tZlqNCNEto8BTrNvNC7MTX502C8f2jmMQJ6mqF2fka1mqx6gqj0eN0B578M=&uipk=5&nbs=1&deadline=1728751557&gen=playurlv2&os=bdbv&oi=1974521428&trid=e1ea04d87f9c4dd69d06a2a219ad942cu&mid=114514&platform=pc&og=hw&upsig=fa5ab7e7a8601b1a3db48ee7bff6827e&uparams=e,uipk,nbs,deadline,gen,os,oi,trid,mid,platform,og&bvc=vod&nettype=0&orderid=0,3&buvid=BE238DCC-7E09-EA3D-7A5A-A35493AC510526248infoc&build=0&f=u_0_0&agrr=0&bw=258502&np=151402657&logo=80000000
```

碰巧使用了镜像备用下载地址，看不出地区。这种链接直接打开就会403，必须修改请求头`referer="https://www.bilibili.com/"`。

