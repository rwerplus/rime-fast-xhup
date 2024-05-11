## Rime 输入法双拼加辅助码方案

Rime 输入法配置文件，小鹤双拼+小鹤形码辅助方案。使用后打字几乎不需要翻页，且学习成本明显低于五笔等输入方案。
如果用户还不了解双拼输入方案，或者不熟悉 Rime 输入法软件，可以先查看 [双拼与 Rime 输入法入门](intro.md)
当然，您也可以先往下翻，看看本项目能提供什么样的功能。

### 皮肤预设

#### 皮肤预览（Windows）

黑色主题`Lumk_dark`

![alt text](image.png)

亮色主题`Lumk_Light`

![alt text](image-1.png)

使用的字体为悦圆（商用需购买，个人可以免费使用）

### 特性说明

- 自创音码键位左右并击规则，替换一些手指 _移动不和谐_ 的小鹤音码编码组合，实现左右手对侧击键, 更有节奏感
- 支持简拼，将常见成语、俗语、古诗首字母放入自定义短语实现，初始词频低，加了长词优选功能，提升在前三候选
- 支持一键展开超级简拼, 输入 4 个字母编码字符后, 按下 `/` 或 `0` 会把词频最高的成语短语词条置顶或显示在候选项里
- 加入了长词优选功能，常见英文单词和成语排在第一页, 中文输入模式下短单词 (字母少于 4 个) 不会置顶和联想补全
- 支持多种常见格式的英文单词输入，如：`Tool`， `TOOL`， `tool` , 非英文单词(如: wechat) 也可有多格式输出
- 支持中英文输入方案中英混合输入自动添加空格, 特定符号 (,.!?:) 后面也会添加空格
- 支持英文单词「自造词」, 在单词末尾输入 `]` 符号, 下次 (重新部署后) 就可以直接输入这个生词了
- 支持强制删词, 按下 `Ctrl+d` / ` Ctrl+x` 触发; 词条降频, 按下 `Ctrl+j` 来触发, 将当前高亮词条放置到第 4 位, 立即生效
- 支持词条置顶, 按下 `Ctrl+t` 触发一键置顶功能, 同一编码下, 先置顶的词条优先级最高, 后置顶的词条置后, 立即见效
- 支持注解切换, 按下 `Ctrl+n` 触发注解轮切功能, 可显示带调拼音/鹤形码/无(即无注解), 立即见效
- 支持 Emoji 表情智能显示, 首页表情降频到第六候选; 支持应用(仅微信)内表情输出, 非应用内表情自动隐藏
- 支持 MacOS 下输入 `/jj` 前缀的自定义短语，触发启动/切换 App 应用; 输入 `/fj` 可见快捷操作菜单 (书签网址, 卡号等)
- 支持 MacOS 下 符号成对输出, 如: `()`, `【】`, `""` 等
- 支持分号 `;` 前缀快捷输出符号, 比如输入 `;d` 自动上屏 `、` , `;j`上屏 `。`, 解决数字后按句号键出英文 `.` 问题
- 支持模糊音，造福平翘舌不分的朋友

### 音码飞键组合说明

- 原理类似 Rime 模糊音， 只是我采用的是 **不对应汉字读音的字母组合** , 或者某些字母组合的汉字是生僻字，会被挪用
- 用来替换的字母组合 和 被替换的字母组合 不会相互影响 正常输入，如若不喜欢或感觉有影响可自行删除调整
- 替换的字母有这些 `e-->q`，`f-->q` ，`t-->d` , `y-->w`, `s-->b`
- ```yaml
  - derive/^(j)n/$1c/
  - derive/^([jyn])t/$1d/ # t --> d
  - derive/^([bjlmn])p/$1e/ # p --> e
  - derive/^([djlnx])q/$1f/ # q --> f
  - derive/^q([biklmnpsxy])/f$1/
  - derive/^qt/fd/
  - derive/^qu/fe/
  - derive/^qr/fo/
  - derive/^qq/fz/
  - derive/^p([okifuhjbnmg])/e$1/
  - derive/^pp/el/ # pp --> el
  - derive/^dp/dl/ # dp --> dl
  - derive/^([jkiu])y/$1w/ # [jkiu]y --> [jkiu]w
  - derive/^y([ikb])/w$1/ # y[ikb] --> w[ikb]
  - ...
  ```

### 方案说明

- 方案名称为“飞鹤快拼”，它提供了小鹤双拼+形码辅助选字的输入方案，使用 `[` 或 \` 引出辅助码。
  - 如果希望使用 `Tab` 键也能引出辅助码，可以在 `flypy_xhfast.custom.yaml` 文件里设置“tab 引导辅助码”。
    默认的 `Tab`，`Shift+Tab` 键功能可以由 `Control+i`，`Control+o` 替代。
  - 如果希望直接输入辅助码而不需要使用符号引导，可以在同样的文件里设置“直接引导辅助码”。
- 允许纯双拼输入。使用形码辅助造词之后，下次可以直接使用双拼部分输入这个词组。
- 例如，输入“输入”这个词组，“输”可以是 `uu`, `uu[i`, `uu[id`，“入”可以是 `ru`, `ru[p`, `ru[pn`，敲 3×3 种输入码都可以得到“输入”一词。
  - 由于作者只找到了常用字的形码部分码表，有的生僻字没有形码，只能敲其双拼音码部分来输入。
  - 双形辅助码根据简体字字形给出，即使在繁体输入模式下也是如此。
    ![小鹤辅助码](xhup.png)
  - 默认为单字（除了手动置顶的那些）显示其小鹤辅助码。可以在 配置文件里设置“关闭单字编码提示”。
  - 若需要专门查某个字的输入码，可以直接在字典文件里搜索，或者利用下方“附加功能”里的 `oq` 前缀。
- 目前本项目已添加使用小鹤原版辅助码的码表 (如涉及侵权，可联系项目作者删除)。
  - 在[这个页面](https://xh.flypy.com/#/xyx)的尾部可以看到小鹤的双形拆分规则。另外，本项目只提供单字形码，
    对词组形码有需求的用户可以用下文中提到的转换脚本来生成带形码的词库

### 文件说明

- 将这些文件放入 Rime 的用户目录下，重新部署（右键点击任务栏的 Rime 图标可见）即可。
  - librime 允许输入法指定用户文件夹的位置。用户文件夹的位置应使用绝对路径。请勿使用相对路径
  - 默认的用户目录:
  - `%APPDATA%\Rime` (Windows，小狼毫: 用户文件夹的默认路径为 %APPDATA%\Rime。也可以通过「开始菜单＼小狼毫输入法＼用户文件夹」打开。);
  - `~/Library/Rime` (MacOS，鼠鬚管: 用户文件夹的路径为 ~/Library/Rime。也可以通过「系统输入法菜单／鼠鬚管／用户设定…」打开。)
  - ibus-rime: `~/.config/ibus/rime`
    fcitx-rime: `~/.config/fcitx/rime`
    fcitx5-rime: `~/.local/share/fcitx5/rime/`
  - `/sdcard/rime` (Android)
  - 如果某些同名文件已经存在，本节的后续部分可能有参考价值。否则，可以直接跳过这些文件内容说明，去看下一节“附加功能”。
  - 如果 Rime 老用户之前已有较多配置文件，希望在不混淆各类配置的同时试用本项目的完整功能。 (毕竟本项目文件较多)，也可以考虑备份/重命名原来的用户目录，将本项目单独放在新建的用户目录下部署。
- 一些设置项需要通过修改文件内容实现。推荐使用 VS Code，Sublime Text 等通用代码编辑器。
  - 没有也不想安装代码编辑器的用户可以考虑使用 [在线 YAML 编辑器](https://codebeautify.org/yaml-editor-online)。
  - 此外，所有配置文件都应以 UTF-8 编码保存，YAML 文件还需要保持严格的缩进 (只能用空格，不能用 Tab 符号)。
- `flypy_xhfast.schema.yaml` 和 `flypy_xhfast.dict.yaml` 为本方案的主要文件。`flypy_xhfast.custom.yaml` 提供了一些常用设置项。其余文件均用于附加功能。
- `default.custom.yaml` 仅用于声明本方案的依赖方案。如果用户已经有同名的文件，并且其中设置了 `schema_list` 选项，可以直接将本项目同名文件的内容添加到该选项下，而不必使用项目提供的这一文件。
- `cn_dicts/*.dict.yaml`, 为中文词库词典文件。
- `en_dicts/*.dict.yaml`, 为英文词库词典文件。
- `rime.lua` 文件用于涉及 Lua 的相关功能。如果用户已经有同名的文件，可以将本项目文件的内容复制添加到原有文件之中，但是可能需要自行确认其中的变量名、函数名与原有的那些没有冲突。
- `scripts/flypy_dict_generator_new.py` 双拼词库转换程序，实现了汉字转小鹤双拼，小鹤音形码，简拼, 支持输出到 `yaml` 字典和 `txt` 自定义短语文件，可指定词库内容追加输出，可指定初始词频，或默认源词库的词频。
- 鉴于部分用户使用的 Rime 版本没有自带 emoji 输入方案，本项目提供了 `emoji.schema.yaml` 和 `emoji.dict.yaml` 文件。如果用户已经有这两个文件，可以不使用本项目提供的版本，不过不排除 emoji 输入时的输入法行为会有所不同。
- `easy_en.schema.yaml` 和 `easy_en.dict.yaml` 为作者基于 [easy-en](https://github.com/BlindingDark/rime-easy-en) 项目的英文输入方案修改得到的版本。如果用户已经有这两个文件，可以不使用本项目提供的版本，但英文单词输入的行为应该会有不同。

### 前缀模式

- `/` 前缀：符号模式，具体见本方案的 [`symbols.custom.yaml`](https://github.com/boomker/rime-fast-xhup/blob/57bb5b093ae164f46ffac52df47b18addf89c2b1/symbols.custom.yaml) 文件。例如：敲 `/jt` 按 3，即可输入箭头“←”。
- `/oh` 前缀：本方案帮助菜单, 输入 `/help` 效果等同, 可查看方案中的快捷键, 功能触发前缀字符串等。
- `/ok` 前缀：小鹤双拼键位查询，该功能为双拼初学者提供。例如：敲 `okian`，可看到韵母 `ian` 对应的按键是 `m`。
- `/oe` 前缀：单词模式，不仅可以敲完整的单词，也允许“简写”，省略掉除了首字母以外的所有元音字母（`aeiou`）。
  例如：敲 `/oe` `elevation `或者 `/oe ` `elvtn` 再加空格，即可输入“elevation”。

  - 该功能基于 [easy-en](https://github.com/BlindingDark/rime-easy-en) 项目，简写特性由 `easy_en.schema.yaml` 文件中设置的拼写运算实现。
    作者对字典文件进行了精简处理以加快部署速度。如果用户希望使用更完整的字典文件，而同时保留简写特性，
    可以尝试将 `easy_en.dict.yaml` 文件更换为原项目的版本。
  - Tips：单词第一次输入时用简写，Rime 会将它的词频记录进用户词典。之后的输入只需要敲完整单词的前半部分，
    它作为输入过的单词就会排在靠前的位置。

- /`jj` 前缀: 用于快速启动或切换程序, 目前只在 macOS 上测试过
- `/fj` 前缀: 用于输入常用短语(邮箱/手机号/银行卡号/收件地址); 和打开常用网站网址, 本地文件路径; 执行常见指令(开关系统设置)
- `/hs` 前缀: 历史上屏记录
- `/cn` 前缀：用于输入中文数字, 例如: 输入 `/cn` `123` 得到 “一百二十三”, “壹佰贰拾叁”, 等。
- `/lt` 前缀：简易 LaTeX 公式。例如：敲 `/lt` `<<f,ff>>ooc0 ` 空格，即可输入“`$\langle f,\phi\rangle\propto 0$`”。

  - 如果发现该功能无法使用，考虑检查所用的 Rime 框架是否支持 Lua，见 [下方的说明](#关于-lua-支持)。
  - 简写由重复的字符触发，例如 `aa` 变成“`\alpha`”。如果重复的字符是 `jvo` 中的一个，需要接上后面的一个字符触发，例如 `jj;` 变成“`\mapsto`”。
  - 使用 `` ` `` 避免重复字符触发，例如敲 `,,bb` 得到“`\math\beta`”不是我们想要的，敲 `` ,,b`b `` 则可以得到“`\mathbb`”。
  - 如果 `` ` `` 两侧的字符不一样，则变成空格。例如，敲 `` \to`0 `` 得到“`\to 0`”。连续的两个 `` ` `` 始终按照一个空格处理。
  - 形如 `x±1` 的上下标较为常见，用 `oo` 接上 `a/s/d/f`（分别代表：上标+1，上标-1，下标+1，下标-1）中的一个，
    再接上一个字符即可触发。例如，`xoodn` 会变成“`x_{n+1}`”。
  - 在 `rime.lua` 里可以设置“启用特殊符号替换”，默认的替换规则是 `{}` 与 `[]` 互换，`()` 与 `;'` 互换，`_^` 与 `./` 互换，
    这使常用符号输入更为方便。替换规则可以自行修改。
    - 例如，现在敲 `f.[2n];x'` 可以得到“`f_{2n}(x)`”。
    - 注意这会影响原有的重复字符触发，例如原来 `..` 变成“`\cdot`”，现在是 `__` 变成它。

- 敲 `date`, `time`, `today`, `week`, `/wd`, /`wt`, `/wk`, `/nl`, 可以输入当天的日期, 时间, 星期, 农历。
- `~` 前缀：部件组字模式 (类似搜狗拼音的 u 拆字模式)，其中部件按照小鹤双拼输入。
  例如，要输入“犇”字 (它可以拆为“牛牛牛”)，敲 `~nqnqnq` 空格即可，并看到这个字的拼音是 `ben`。
- `;` 前缀: 用于自动上屏一些标点符号, 具体编码在 [`symbols.custom.yaml`](https://github.com/boomker/rime-fast-xhup/blob/57bb5b093ae164f46ffac52df47b18addf89c2b1/symbols.custom.yaml) 里, 可自行修改。
- `;f` 前缀: 表情模式, 用于输出常用 emoji 表情和微信表情。比如, 输入 `;fdv` 会输出 ✅, 输入 `;fhj` 会输出 🚀
- `V` 前缀：表情模式, 用于输出 emoji 表情。比如, 输入 `Vuvgo`, 会输出「水果」类表情

### 额外的键位

- 对 Rime 默认 Emacs 键位的一些补充：

  - `Control+m` 可以替代回车。例如，敲 `yyds` 之后按这个键，输入的就是"yyds"。
  - `Control+w` 可以替代 `Control+退格`，为删一个字的码。例如，敲 `buk` 或者 `buke[dk` 之后，
    按这个键得到的都是 `bu`，可以继续敲后面的字。如果在词组输入时发现敲错了，可以用这个方式删掉最后的字。

  > Rime 自带的 Emacs 键位包括 `Control+[` 替代 `Esc`，取消当前输入；以及 `Control+h` 替代退格。另外，作者喜欢用 `Control` 键是因为在系统里配置了大写锁定和左 `Control` 交换，这样按起来很舒服。由于这是系统的配置而不是 Rime 的，本文件中没有说明其设置方式。

  - 词组的双拼部分输入完成后，可用 `` ` `` 键逐字追加辅助码。例如，想输入「林纳斯」，
    可以敲 `` lb`m na`sn si`q ``，这与直接敲 `lb[m na[sn si[q` 是等价的。
  - 这也能用于重码太多的词库已有词。例如，希望输入“适时”一词，敲 `uiui` 发现候选太多，补上最后一个字的形码后 `uiui[oc` 还是没在第一页看到它。此时按 `` ` ``，输入框成为 `ui[ 光标 ui[oc`。补充敲下第一个字的形码部分 `z`，然后按 `Control+e`（或者 `End`）把光标移动到最后，即可看到想要的“适时”一词出现在候选中。
  - 可以在 `flypy_xhfast.custom.yaml` 中将 `` ` `` 改成 `Tab`，`Control+Tab` 或 `]` 等键。
  - 如果不希望自动补充 `[` 符号，其实可以直接改按 `Control+i` 或 `Shift+Right` 移动光标，不必使用 `` ` `` 键。
  - 对于安卓 Trime 用户来说，可能还需要在 `trime.custom.yaml` 里加上这一句 (放在 `patch:` 下, 注意缩进):

    ```yaml
    style/horizontal: false
    ```

    ←→ 方向键在 Trime 默认用来移动候选项，这一设定将它改成移动光标（和电脑版的默认行为一致），
    从而这个补充辅助码的快捷键才能正常工作。

    另外，如果用户不嫌麻烦的话，也可以在第一次按 `` ` `` 键前先按 `Home` 或 `Control+a`
    (Trime 默认的虚拟键盘中长按 `a` 也行) 把光标移动到开头。这样就无需改动 Trime 方向键的功能。

  - 在开启了「直接引导辅助码」的条件下，由于音节组合方式可能出现歧义，这一功能不总能正常运行。

### 关于 Lua 支持

- 建议手动从 [librime 项目](https://github.com/rime/librime/releases) 安装或自行编译。
- 小狼毫（Windows）和鼠须管（MacOS）的最新版本应该都支持 Lua 。
- Trime（Android）要在 [GitHub 页面](https://github.com/osfans/trime) 下载最新测试版（注意不是稳定版）。
  另外，Trime 自带的配置文件可能有缺失，此时可以考虑将电脑版 Rime 系统目录里的配置文件也复制到 Trime 的配置目录中，比如朙月拼音的方案文件和字典文件。
- 对于中州韵（Linux），据说 Arch Linux 源提供的 fcitx5-rime 可以在插件设置里开启 Lua 支持。
- 其他发行版的用户可以考虑这个 [ibus-rime AppImage](https://github.com/hchunhui/build)。遇到调频失效等问题可以试着删除各 userdb、build、sync 文件夹重新部署/同步。如果这一问题反复出现，或者重启/部署/同步之后经常忘掉之前输入的词，可以尝试在 `flypy_xhfast.custom.yaml` 里开启“用户词典记录为文本格式”，或者看这个 AppImage 有没有发布新版本。

### 给进阶用户

这一 Rime 输入方案的制作主要利用了这些文档，希望对 Rime 进行更深入的个性化配置的用户可以参考：

- [GitHub-UserGuide](https://github.com/rime/home/wiki/UserGuide)（访问 GitHub 不稳定的可以用 [Gitee 版 UserGuide](https://gitee.com/lotem/rime-home/wikis/UserGuide)）。其中介绍的 Rime 基本用法适合新手查看，而最开始的“專題”一节还给出了若干有用的链接，供用户在个性化配置时查阅。
  - 其实 UserGuide 只是该项目 wiki 中的一个文件，在网页查看的时候，侧栏里可以看到 wiki 的其他文件，它们也有参考价值。
  - 例如，如果部署后发现没有达到预期的效果，可以考虑从侧栏里点进 `RimeWithSchemata`，按照其中“關於調試”一节下的说明，在日志文件里查找是否有部署出错的提示。
- [设定项详解](https://github.com/LEOYoon-Tsaw/Rime_collections/blob/master/Rime_description.md)。这一文档主要解释了方案文件中各个选项的含义，并且提供了一些配置的例子。

### FAQ

1. - Q: Windows 系统部署项目失败, 一直处于部署中
   - A: 注释 **[flypy_xhfast.dict.yaml](https://github.com/boomker/rime-fast-xhup/blob/a877ed5632de7edf133fe116de05eb601f7e838f/flypy_xhfast.dict.yaml)** 文件里大词库
2. - Q: 恢复默认单双引号 `'` `"` 输出方式
   - A: 在[主配置文件](https://github.com/boomker/rime-fast-xhup/blob/a877ed5632de7edf133fe116de05eb601f7e838f/flypy_xhfast.schema.yaml)里注释这[两行](https://github.com/boomker/rime-fast-xhup/blob/a877ed5632de7edf133fe116de05eb601f7e838f/flypy_xhfast.schema.yaml#L266-L267)
3. - Q: 恢复默认分号 `;` 输出方式, 不想使用 `;`引导的标点符号输出方式
   - A: 在[主配置文件](https://github.com/boomker/rime-fast-xhup/blob/a877ed5632de7edf133fe116de05eb601f7e838f/flypy_xhfast.schema.yaml)里解开[这行](https://github.com/boomker/rime-fast-xhup/blob/95ee165863b37087b6c3776c9ddecf9f525b42e4/flypy_xhfast.schema.yaml#L264)注释, 并将下一行注释掉
4. - Q: 如何取消中英候选词条中的空格?
   - A: 注释主配置文件里的[这行](https://github.com/boomker/rime-fast-xhup/blob/a877ed5632de7edf133fe116de05eb601f7e838f/flypy_xhfast.schema.yaml#L101)
5. - Q: 中英混合输出自动添加空格功能, 有时会在编辑区起始位置添加空格
   - A: 这个功能目前还不够完善, 可以将[这行](https://github.com/boomker/rime-fast-xhup/blob/95ee165863b37087b6c3776c9ddecf9f525b42e4/flypy_xhfast.schema.yaml#L50)注释掉
6. - Q: 形码辅助引导符可以去掉吗? 想直接使用辅助码, 不用引导符
   - A: 可以的, 取消[这行](https://github.com/boomker/rime-fast-xhup/blob/a877ed5632de7edf133fe116de05eb601f7e838f/flypy_xhfast.custom.yaml#L38)注释, 并放到 `speller` 这行下面
7. - Q: 快捷指令功能能在移动端支持触控点击吗?
   - A: 目前暂不支持
8. - Q: 符号配对功能有时会有光标居中动作的滞后现象
   - A: 这个功能目前是通过 [`applescript`](https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/introduction/ASLR_intro.html) 来实现的, 性能不佳, 得其他方式实现才行
9. - Q: 在微信聊天里, 有一些候选项带有中括号 `[]`是怎么回事?
   - A: 这是微信表情, 在候选菜单里不能显示, 在微信里可正常显示. 是通过 [`OpenCC`](https://github.com/BYVoid/OpenCC) 在 [`emoji_word.txt`](https://github.com/boomker/rime-fast-xhup/blob/84e5314dfd70a3286587164233a9576d8d188ee4/opencc/emoji_word.txt) 编码的
10. - Q: 音码键位左右并击规则是什么, 可以删除或不启用吗?
    - A: 这些规则采用了 不对应汉字读音的字母组合来编码一些小鹤双拼的音码. 可以不启用, 注释掉 [这些行](https://github.com/boomker/rime-fast-xhup/blob/95ee165863b37087b6c3776c9ddecf9f525b42e4/flypy_xhfast.schema.yaml#L136-L194) 即可
11. - Q: 词库中存在注音错误的词条
    - A: 因为采用开源的 [`pypinyin`](https://github.com/mozillazg/python-pinyin) 项目，存在词组中多音字返回了另外一个注音
12. - Q: 有一些字打不出来, 字表中的字不全或形码错误
    - A: 生僻字可以通过上述的 `~` 反查功能来输入. 字表的形码错误, 可能是容错码, 可自行修改
13. - Q: 候选菜单里有无法显示的像「问号」一样的候选字
    - A: 在 [`squirrel.custom.yaml`](https://github.com/boomker/rime-fast-xhup/blob/84e5314dfd70a3286587164233a9576d8d188ee4/squirrel.custom.yaml) 或 [`weasel.yaml`](https://github.com/boomker/rime-fast-xhup/blob/84e5314dfd70a3286587164233a9576d8d188ee4/weasel.yaml) 配置可以正常显示的字体, 推荐 [`MiSans`](https://hyperos.mi.com/font/download)
14. - Q: `~`反查出来在字没有注音, 部署日志中提示缺少 `kMandarin`
    - A: 请自行到这个[项目](https://github.com/mirtlecn/rime-radical-pinyin/releases)下载反查注音文件, 或将 `others` 下的 `kMandarin.reverse.bin` 移动到 `build`目录里

### 鸣谢

- [自然快手](https://github.com/functoreality/rime-flypy-zrmfast), 本项目方案最开始受到此项目启发, 多个功能来源于它
- [雾凇拼音](https://github.com/iDvel/rime-ice), 本项目方案词库由此项目转换而来, 一些功能来源于它
- [汉字部件拆字](https://github.com/mirtlecn/rime-radical-pinyin), 汉字反查方案功能来源于它
- [Rime](http://rime.im/), 开源输入法框架, 本项目方案来源于它
- 热心网友, 其他开源输入法方案
