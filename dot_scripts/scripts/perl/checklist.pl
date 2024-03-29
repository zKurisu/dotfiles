#! /usr/bin/perl  checklist.pl
#
#  function
#
#  Copyright (Perl) Jie
#  2023-02-03
#
use 5.36.0;
use utf8;
use experimental qw(switch);
use lib '/home/jie/scripts/perl/';
use My::Utils;

binmode( STDOUT, ":utf8" );
my %data = (
    phy => [qw(一个电子的电荷量 库仑定律中的k和epsilon的关系
            电场的定义式 无穷大的平面对其轴线上一点的电场 电荷在电场中运动的运动公式
            电偶的定义 电偶和力矩的关系式 电偶矩做功公式 电通量的定义
            为什么导体内的电场非常小 高斯定理的推导 电势的定义
            E和Q的关系式 V和Q的关系式 电势和电场的关系式
            电偶对一点的电势 电势和电势能的关系 影响电容大小的因素其公式如何推导 和温度相关的电阻率关系式
            微观下的电流表达式 电流密度的定义 如果电线横截面上的电流密度相等则有 如果电线横截面上的电流密度不相等则有
            某一点电流密度的方向为 什么是漂移速度 一段时间通过截面的总电荷量 什么是超导现象 emf和端电压的关系
            电介常数的定义 磁这一名称的由来 磁性的由来
            磁感线方向的定义 形成匀强磁场的条件 右手定则判断电流和磁场方向
            右手定则判断磁场中受力方向 磁力的大小和什么有关 磁场强度的定义
            磁力的微观推导式 在均匀磁场中的运动有什么特点 圆周运动公式
            均匀磁场中的圆周运动公式 同时位于磁场中时力的公式 磁偶矩公式推导 霍尔效应的内容
            两个平行导线间的力 安培定理的推导 安培定理和哪些量有关
            螺线管产生的磁场公式 环形螺线管产生的磁场公式 毕奥萨伐尔定律的公式求电流对一点产生磁场内容
            电磁和螺线管的关系 将磁性物质加入到磁场中会有什么变化 磁通量的定义以及起通用描述表达式
            法拉第电磁感应的内容 楞次定理的内容 感应电动势定义 移动导体中的感应电动势即导体棒移动时的电动势公式
            导体棒受力公式推导 法拉第公式的通用写法即emf的另一种写法 互感系数和自感系数的定义式 自感系数和互感系数与什么有关
            形成互感的原因是什么 推导为什么互感系数与电流大小无关 互感的一个应用
            麦克斯韦方程组的内容 完整版的安培定理 位移电流的写法 位移电流的推导 辐射场中E和B的大小变化
            电磁波携带的能量变化 电磁波的速度公式 可见光波长范围 可见光频率范围 可见光波长和频率换算公式
            存储在电场中的单位体积的能量 存储在磁场中的单位体积的能量 存储在电磁波中的单位体积的能量
            只包含电场或磁场的能量公式及换算 电场和磁场关于时间和位置的方程 什么是坡印廷矢量其定义
            坡印廷矢量的公式计算及推导 平均坡印廷矢量的计算公式 辐射压的定义 辐射压公式及其推导 爱因斯坦狭义相对论的假设
            狭义相对论中的同时性 时间膨胀思想实验内容 时间膨胀关系式 长度收缩思想实验内容 
            长度收缩关系公式 伽利略变换和洛伦兹变换的思想实验内容 伽利略坐标变换和速度变换公式及其适用条件
            洛伦兹变换推导条件 洛伦兹坐标变换和速度变换公式 利用洛伦兹变换推导时间膨胀和长度收缩
            求得相对论动量和质量的思想实验内容 相对论动量和质量公式以及推导 在相对论中牛顿第二定理可以写为
            相对论中的极限速度是多少 相对论中对质量的观点 相对论中静止能量是多少 相对论中能量公式
            热力学中物体发出的射线的强度和开氏温度的关系 什么是黑体 什么是黑体辐射 维恩公式的内容
            为什么会有黑体问题 普朗克常量的值 普朗克的量子假设是什么 爱因斯坦的光子假设是什么
            光电效应是什么现象 光电元件指什么 什么是光电效应中的截止电压 光电效应中电子获得的最大动能是多少
            光的波动中最重要的性质是什么 光的粒子理论预测了什么 什么是work_function其值如何计算 光子从金属板到达电极至少需要多少能量
            什么是康普顿效应 能量动量和质量的关系式 能量动量和光速的关系式 康普顿位移的计算方法
            电子的质量是多少 电子的康普顿波长是多少及其计算方法 什么是pair_production 已知功率求每秒发射的光子数
            德布罗意认为粒子的波长和什么有关关系式为什么 德布罗意波的计算方法 普通物质德布罗意波的量级
            电子的德布罗意波计算 为什么热的物体会发出辐射 让稀有气体发出光线的方法 什么是发射光谱 什么是吸收光谱
            Balmer序列公式 雷德博格常量的值为 Lyman序列公式 Paschen序列公式 波尔对电子失去能量的假设
            波尔量子状态公式 动量和动能的关系式 波尔半径的值波尔模型中的半径公式 波尔模型中求动能和势能 氢原子的势能和动能的关 德布罗意对原子的假设 波的重要性质有哪些
            波尔模型中的能量公式 波尔模型中计算氢原子波长用什么公式 对于其他粒子其能量公式和氢原子能量公式的关系
            光的能量密度和单位体积中光子数量的关系 薛定谔波动方程的作用 波函数的平方的含义 什么是海森堡测不准原理
            观察物体的器材的精确度取决于什么 海森堡测不准原理的两种数学表达及其最小误差 什么是经典物理学的确定性观念
            薛定谔方程是如何得来的 经典力学中解决问题的两个方法 描述粒子的波的方程为 一阶薛定谔方程时间无关版本公式及其推导
            hbar的值为多少 什么是normalization_condition 一阶薛定谔时间相关方程及其推导 一阶薛定谔时间相关方程由时间无关形式和指数表达
            波函数中的k等于多少 无限深方势井的特点 薛定谔方程的解为什么 无线深方势井的能量公式推导 无线深方势井的零点能量 
            无限深方势井中k和L的关系式 无限深方势井中每一个能量状态的波动方程 无限深方势井中A的值
            无限深方势井中粒子的德布罗意波计算 无限深方势井中的粒子的最大波长为多少 量子隧道的概率计算传输系数计算以及常量G定义 氢原子的薛定谔方程 三个主量子数的定义及公式
            给定主量子数求量子状态数 给定主量子数求能量和角动量
            氢原子的波函数 哪些电子位于同一个shell中 哪些电子位于同一个subshell中 有哪些Shell 有哪些subshell
            电子云可以被看作是什么其密度如何计算 什么是主量子数 什么是轨道量子数 什么是磁量子数
        )],
    phyppt => [qw(normalization_condition  毕奥萨伐尔定律内容 感应电动势定义 Balmer公式

        )],

    phyhard => [qw(电偶对远处一点的电势 磁偶矩做功 毕奥萨伐尔定律 什么时候使用巴尔默公式 波尔状态公式 无限深方势井的能量公式推导
            氢原子的薛定谔方程 氢原子的波函数

        )],

    cad => [qw(电子的电荷量是多少 电子的质量是多少 电压的定义式 电流的定义式 什么是有源元件 什么是无源元件
            电导的定义式 基尔霍夫电流定律的内容 基尔霍夫电压定律的内容 利用基尔霍夫电流定律能够得到的独立电流方程式个数
            电阻分压公式 惠斯通电桥计算电阻的公式 电桥平衡的条件是什么 Delta_Y_T这些变换的关键是什么
            什么是节点电压法  什么是基本节点 什么是网孔 节点电压和非独立源 什么是超节点 什么是网孔电流法 网孔电流法和非独立源
            什么是超网孔 电源变换的核心理念 电源变换需要满足的条件是及其推导 什么样的电路可以简化 什么时候使用戴维南或诺顿等效电路
            戴维南电路的求解步骤注意变换前找好端口 求r_th的电路中仅仅含有独立源 求r_th的电路中含非独立源
            最大功率传输公式及其推导此时的电阻是什么特点 什么是叠加原理
            运算放大器有哪些端口 运算放大器有哪些特点 运算放大器的参考电流方向为哪里哪个点的电势视为0
            为什么要添加负反馈 反相放大器的特点 反相放大器的输出电压和输入电压之比以及推导过程
            求和放大器是以什么为基础的 什么是同相放大器电路其特点 差分放大器是由什么构成的 电感的特性基于什么 串联RL电路的转移函数公式及其推导
            电容的特性基于 用电感上的电流表示电压 用电感上的电压表示电流 电感中的功率和能量
            用电容上的电压表示电流 用电容上的电流表示电压 电容中的功率和能量 电容和电感的串并联公式及其推导
            cad中的法拉第定律 磁链的定义 cad中磁通量的定义 自感和磁导的关系式 互感和磁导的关系式 
            用自感表示互感 耦合系数k的值 一对线圈中的总能量 什么是RL电路 什么是RC电路 什么是固有响应
            一般RL和RC电路有那四种可能形式 什么是阶跃响应 求解固有响应等同于求解什么 RL电路固有响应的电流表达式
            为什么需要时间常数 RL电路固有响应中的时间常数 时间常数的一个重要特征 RC电路固有响应的电压表达式
            RC电路固有响应的时间常数 RL电路阶跃响应电流表达式 RL电路阶跃响应时间常数 RC电路阶跃响应电压表达式
            RC电路阶跃响应时间常数 固有响应和阶跃响应一般解法的微分方程
            什么是RLC电路 并联RLC电路的二阶线性微分方程及其推导 解二阶微分方程的典型方法 并联RLC电路的二阶线性微分方程带入特解后的方程形式
            并联RLC电路的二阶线性微分方程的特征方程以及其根为多少此时原方程的根又是多少 并联RLC电路的固有响应的电压表达式为多少
            奈培频率的值为多少 谐振角频率的值为多少 特征方程根的写法为 如何判断三种阻尼形式
            串联RLC电路的固有响应的二阶线性微分方程以及其特征根方程以及其解
            正弦信号源的电压表达式 omega的定义式以及其为什么叫角频率
            弧度与度的关系 正弦电压电流函数的一个重要特性 正弦函数角度相差一个周期其值
            正弦阶跃响应RL电路的公式如何列出 什么是电流的暂态分量 什么是电流的稳态分量 什么是全响应
            欧拉定理的内容 什么是相量写出其基本表达式 相量变换的写法 欧拉定理的内容 相量的三角函数形式 将相量的三角函数形式用欧拉公式变换
            反相量变换 反相量变换的写法 如何用相量计算正弦电压函数的和 如何计算复数的模长
            相量域下电阻两端电压和电流相量关系式及其推导 电阻的频域等效电路如何画 
            相量域下电感两端电压和电流相量关系式及其推导 电感的频域等效电路如何画 
            相量域下电容两端电压和电流相量关系式及其推导 电容的频域等效电路如何画 
            阻抗的定义 电阻的阻抗值 电感的阻抗值 电容的阻抗值 频域中仍然满足的定理
            两个相量相除的技巧 并联和串联阻抗的计算 导纳的定义 拉氏变换的定义 为什么需要拉氏变换
            阶跃函数的作用以及其特点其为了解决 阶跃函数对未定义点有什么假设 阶跃函数的一个记法
            冲激函数的作用以及其特点其为了解决 冲激函数的数学定义 冲激函数的筛选特性表达式
            冲激函数微分的拉氏变换 冲激函数高阶微分的拉氏变换 单位阶跃函数的拉氏变换 算子变换中乘以常数
            算子变换中的加减法 
            列转移函数的基本思路是什么 转移函数的标准形式是什么 各个常见电路元件的s域等价形式是什么
            截止频率定义及其的计算方式 截止频率处电路提供的平均功率 转移函数的振幅的计算方式 低通和高通滤波器的转移函数的标准形式分别是什么
            串联RL电路的截止频率公式 如何定性分析电路 串联RC电路的定性分析 串联RC电路的转移函数以及其幅值计算 串联RC电路的截止频率以及其计算方式
            时域和频域的关系即时间常数和截止频率的关系 对于高通滤波器其转移函数的最大值如何计算
            串联RC高通滤波器的转移函数以及其幅值计算以及其截止频率计算 串联RC电路其高通和低通有什么共同点
            串联RL高通滤波器的转移函数以及其幅值计算以及其截止频率计算 串联LC电路其高通和低通有什么共同点
            带负载的串联RL高通滤波器 将无负载滤波器和带负载滤波器进行对比可以得到什么结论 
            带通滤波器如何决定通带 三个表征带通滤波器的参数是什么以及其定义 五个特征参数之间有什么联系 低高通滤波器和带通滤波器在组成上有什么不同
            串联RLC带通滤波器电路如何定性分析 串联RLC带通滤波器电路的转移函数以及其标准形式是什么其幅值如何计算 串联RL带通滤波器C电路的中心频率如何得到
            串联RLC带通滤波器电路截止频率计算 并联RLC带通滤波器如何设计其转移函数以及其幅值 并联RLC带通滤波器的带宽以及品质因数
            幅值变换式 频率变换式 幅值和频率共同变换式 如何处理RC和RL电路
        )],
    cadhard => [qw(并联RLC电路
            
        )],

    cadexam => [qw(使用KCL current_divider_rule指分流法 要画响应曲线图 
            calculate_the_expression_of_its_frequency_response_with_input_V_in_and_output_V_out_as__function_of_omega_就是求转移函数
            cut_off_frequency_和角频率不同_计算时要除以2PI
            summing_the_currents_leaving_node1_就等同于利用基尔霍夫电流定律列电压方程

        )],

    stat => [qw(什么是随机试验 随机试验的特性有哪些_三个 什么是样本空间 什么是样本点 什么是基本事件 什么是随机事件以及其特征
            和事件的计算方式及其概率写法 积事件的计算方式及其概率写法 什么是互斥 什么是互逆 什么是差事件 德摩根定理的内容 串联系统的特征 并联系统的特征
            频率的记法 频率的性质 若A_1A_2等两两不相容则频率写法有 频率中n特别大时会有 概率的性质 什么是可列可加性 不相容等价于 概率和它的逆的关系 若A属于B则有 概率的加法公式及其推导
            加法公式推广 BA这个写法表示的是什么 "P(B-A)等价于什么" "P(C-B-A)等价于什么" "A_1和A_2互斥其并集的概率等价于" 什么是古典概型 古典概型概率计算公式 a排列和组合公式 什么是实际推断原理
            组合中需注意的公式 全排列公式 无放回抽样的总情况数 生日问题的解法 组合的括号写法 挑选礼物问题的解法和无序有放回公式 挑选礼物问题可以抽象为什么问题
            条件概率的定义 为什么称为条件概率 条件概率满足的三条公理 条件概率的可列可加性 条件概率的乘法公式 交集形式的概率都可以转化为什么
            什么是全概率公式及其推导 什么是Bayes公式其用来计算什么 A与B相互独立代表什么 A与B独立时有什么推导式
            A交B的逆可以写为什么 A和B相互独立则哪些也相互独立及其推导独立事件的推广 如何证明两个事件是独立的 独立事件交集的概率可以写为
            互斥和独立的关系 什么是重复试验 什么是二项式 什么是二项式系数 什么是多项式系数
            如何写概率分布律 0-1分布的分布律及其特点和记法 什么是伯努利试验 什么是n重伯努利试验 什么是二项分布其别称是什么其表达式和记法 二项分布的概率密度函数的写法
            二项分布的注意公式即其与泊松分布的关系 伯努利试验的期望以及n重伯努利试验的期望为多少 伯努利试验的方差以及n重伯努利试验的方差为多少 均匀分布的内容是多少如何推导其记法是什么 
            均匀分布的期望和方差是多少 什么是泊松分布及其记法 什么是泊松定理 泊松分布的期望和方差是多少 什么是超几何分布及其写法 什么是几何分布及其写法
            什么是指数分布 指数分布的内容和记法 指数分布的分布函数和性质 指数分布的期望和方差是多少 什么是随机变量的分布函数其有何性质 分布函数又叫 什么是概率密度函数其有什么性质 分布函数和概率密度函数有何关系 
            概率密度函数积分的值为多少 连续和非连续随机变量的概率密度函数的写法如何  正态分布的密度函数内容及其性质和图像和记法 
            和正态分布相关的一个积分的结论 正态分布的分布函数写法 正态分布中的未知数的作用 标准正态分布的密度函数分布函数和记法 标准正态分布的性质
            一般正态分布的密度函数和分布函数转化为标准正态分布 上alpha分位数的记法和含义 正态分布的期望和方差是多少
             二元随机变量的写法 二元分布的分布函数和概率密度函数写法 混合二元分布的含义是什么 二元分布中概率密度函数的求法
            离散型随机变量的概率分布律如何画其表达式如何 离散型随机变量的两个性质 如何理解边际分布律 边际分布律的写法 由二元分布的密度函数得到边际分布的密度函数 边际分布的注意事项
            多元分布中其随机变量相互独立则分布函数可以写为 条件分布的写法 概率密度函数的全概率公式 条件分布的Bayes定理 多元变量的边际分布写法 随机变量的函数的解法 卷积公式 辛普生分布
            期望的计算方法包括连续和不连续数以及其符号表示 什么情况下期望不存在 概率密度函数的本质是什么 数学期望和概率密度函数的关系 数学期望的三个特性:常数的期望常数系数和随机变量加法 独立随机变量的期望  mean和median的区别
            离散和连续变量的条件期望的写法 方差的意义  方差的计算和记法 什么是标准差 方差和概率密度函数的关系  方差的简便计算方法 方差的性质:常数的方差常数系数和随机变量加法 几种常见分布的期望和方差 什么是样本的平均值
            柯西分布的特点 矩的定义 一阶矩和二阶矩的含义和作用 什么是中心矩 二阶中心矩的含义 什么是矩生成函数 矩生成函数的导数的性质 协方差有什么作用  什么是协方差定义其计算方法如何  
            协方差的正负说明什么 协方差为零说明什么 协方差和方差的关系 相关性的计算方法 施瓦兹不等式的内容 柯西-施瓦兹不等式内容 当X和Y线性相关时有什么结论
            大数定理想说明什么 马尔可夫不等式内容 切比雪夫不等式内容 中心极限定理名称的含义 中心极限定理的内容 什么时候使用中心极限定理 棣莫弗–拉普拉斯中心极限定理的内容 统计量的定义 什么是样本变量什么是观测值
            卡方分布的自由度代表什么 卡方分布的期望和方差为多少 两个卡方分布相加的结果 x属于卡方分布当n充分大时有 卡方分布的上alpha分位数 t分布的自由度和什么有关 
            怎样得到t分布 什么是参数估计 什么是参数空间 什么是点估计 什么是区间估计 参数估计的写法 什么是矩估计法其主要思路是什么 一阶样本的矩如何求 二阶样本的矩如何求 什么是极大似然估计法其名称的解释
            极大似然估计法的解题步骤 原假设和被择假设的概念和表示方法 什么是罕见事件原理 如何判断假设的成立与否 什么是简单假设 什么是复合假设 什么是单边假设 什么是双边假设
        )],

    stathard => [qw(什么是差事件 什么是德摩根定理 挑选礼物问题的解法和无序有放回公式 A和B独立时有什么推导式 指数分布的无记忆性如何使用 多元分布中其随机变量相互独立则分布函数和密度函数可以写为
            条件分布函数的写法 概率密度函数的全概率公式 条件期望的写法 方差和概率密度函数的表达式 什么是矩生成函数其缩写是什么 协方差的计算公式 施瓦兹不等式 柯西-施瓦兹不等式
            中心极限定理内容 棣莫弗-拉普拉斯中心极限定理内容 x属于卡方分布当n充分大时有 卷积公式 做卷积的题需要注意什么其解题步骤 求c.d.f的积分 如何求矩估计 如何求极大似然估计 置信区间的三种情况 
            假设检验的情况且如何求
        )],

    game => [qw(supertuxkart xonotic minetest wesnoth openttd openra flare ryzom
        )],

    tool => [qw(tcpdump geogebra lyns w3m vagrant msfconsole metasploit bf66.me maltego
            hypnotoad
        )],

    sql => [
        "\e[32m创建用户\e[0m            : CREATE USER 'newuser'\@'localhost' IDENTIFIED BY 'password';",
        "\e[32m给用户添加权限\e[0m      : GRANT ALL PRIVILEGES ON dbname.* TO 'username'\@'hostname';",
        "\e[32m查看当前用户\e[0m        : SELECT USER();",
        "\e[32m查看数据库中所有用户\e[0m: SELECT User FROM mysql.user;",
        "\e[32m删除数据库中的用户\e[0m  : DROP USER 'myuser'\@'localhost';",
        "\e[32m查看已存在的数据库\e[0m  : SHOW DATABASES LIKE 'name';",
        "\e[32m进入一个数据库\e[0m      : USE databasename;",
        "\e[32m切换到另一个数据库\e[0m  : USE anotherdatabasename;",
        "\e[32m查看当前使用的数据库\e[0m: SELECT DATABASE();",
        "\e[32m显示数据库中的所有表\e[0m: SHOW TABLES;",
        "\e[32m显示一个表中的所有列\e[0m: DESCRIBE tablename;"
        ],

    task => [
        "英语 CV, Cover Letter, Portfolio",
        "数电进度",
        "模电进度",
        "英语 Group interview 准备",
        "EP 进度",
        "模电实验"
    ],

);


if ($ARGV[0] ~~ 'rand') {
    my $array_name = $ARGV[1];
    print "How many?\n-> ";
    chomp (my $num = <STDIN>);
    RandArray( $data{$array_name}, $num );
}
else {
    my $array_name = $ARGV[0];
    ShowArray( $data{$array_name} );
}
