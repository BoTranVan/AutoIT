#cs ----------------------------------------------------------------------------

 AutoIt Version: 1.0.0.0
 Author:       Nguyễn Viết Hiện

 Script Function: 
	Chương trình của tôi.
Ngôn ngữ: Tiếng Việt
#ce ----------------------------------------------------------------------------
;Khai báo

#include <Misc.au3>
#include <StaticConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GuiButton.au3>
#include <ComboConstants.au3>

#NoTrayIcon
; Script Start - Add your code below here
Global $toa_do, $hien_thu, $hien_ngay,$hien_thang, $hien_nam, $hom_nay, $phong_to, $gui
Global $GUi, $close, $an,  $thu1, $thu2, $ngay_c, $thang_ct, $thang_cp, $nam_c
Global $danh_ngon, $array[200], $about, $i, $gio, $Tien, $hien_tai, $lui, $can_chi, $xhtd, $can_chi_ngay, $can_chi_thang
Global $can[10],$chi[12]
Global $ngay_am, $thang_am, $tet, $gio1
Global $nam, $nhuan, $dem, $j, $day100, $mon100, $year100, $ten_lich, $tuy_chon, $tieu_de, $lich_loc, $lich_tuong, $gui1, $gui3, $gui2
Global $day200, $month200, $year200;
Global $tat, $gui4
Global $msg, $gui5, $thu_nho, $ngay[7][7]
$hien_ngay=@MDAY
$hien_thu=@WDAY
$hien_thang=@MON
$hien_nam=@YEAR
$toa_do=1024
$hom_nay='Hôm nay'
$phong_to=123456789
;Khai báo cho can
	$can[0]='Giáp'
	$can[1]='Ất'
	$can[2]='Bính'
	$can[3]='Đinh'
	$can[4]='Mậu'
	$can[5]='Kỷ'
	$can[6]='Canh'
	$can[7]='Tân'
	$can[8]='Nhâm'
	$can[9]='Quý'
	
	;Khai báo cho chi
	$chi[0]='Tý'
	$chi[1]='Sửu'
	$chi[2]='Dần'
	$chi[3]='Mão'
	$chi[4]='Thìn'
	$chi[5]='Tỵ'
	$chi[6]='Ngọ'
	$chi[7]='Mùi'
	$chi[8]='Thân'
	$chi[9]='Dậu'
	$chi[10]='Tuất'
	$chi[11]='Hợi'
	;Khai báo danh ngôn kiểu mảng
	
	$array[0]='Một văn sĩ chính thật là một con người không cam chịu cảnh cô quạnh. Mỗi một con người chúng ta là một bãi sa mạc.'&@CRLF&'(Francois Hermant)'
	$array[1]='Đàn ông phải biết đối đầu với dư luận, còn đàn bà thì khuất phục dư luận. (Bà De Stael)'
	$array[2]='Phần thứ nhất của cuộc đời ta bị bỏ phí là do cha mẹ ta, phần thứ hai là do con ta. (Clarence Darrow)'
	$array[3]='Chưa chắc bạn cưới một người vợ y tá mà bạn được chăm sóc.'
	$array[4]='Bình đẳng là cơ sở vững chắc của tình yêu. (G. Let-xinh)'
	$array[5]='Đừng đợi cơ hội thuận tiện, phải biết tạo ra nó. (O. S. Marden)'
	$array[6]='Ngôi nhà phải là trung tâm chứ không phải là biên giới trong thế giới của người phụ nữ.'
	$array[7]='Người ta chỉ tạo nên hạnh phúc của mình do việc săn sóc đến hạnh phúc của người khác. (Bernardin De Saint Pierre)'
	$array[8]='Những gì ta cho đi một cách thật lòng thì mãi mãi là của ta. (Geoges Granville)'
	$array[9]='Mọi đứa trẻ sinh ra đều là thần thánh, chỉ sau đó mới sa ngã thành con người.'
	$array[10]='Chỉ thiếu mặt người mình yêu, mình thấy cả vũ trụ như vắng người. (Lamartine)'
	$array[11]='Người đàn bà đẹp khó mà sống được an thân, cũng như ngọc quý là mồi của trộm cướp. (Jean Jacques Rousseau)'
	$array[12]='Người ta nói rằng khi một người đàn ông nắm tay một phụ nữ trước hôn nhân thì đó là tình yêu; còn sau hôn nhân đó là sự tự vệ.'
	$array[13]='Cô ta là một bạn gái tốt đến mức sẵn sàng đẩy tất cả bạn bè xuống nước để sau đó với niềm thích thú kéo họ lên.'
	$array[14]='Người duy nhất không mất khách hàng khi suy thoái, đó là người thu thuế.'
	$array[15]='Tình yêu của các chàng trai không nằm ở phía trái tim mà ở đôi mắt. (Shakespeare)'
	$array[16]='Không có ngày mai nào lại không kết thúc, không có sự đau khổ nào lạo không có lối ra. (Rsoutheell)'
	$array[17]='Lời nói có hiệu quả hơn 10 vạn khẩu thần công. (Napoléon)'
	$array[18]='Người đàn bà đẹp luôn luôn lấy chồng không ra gì. Vì người đàn ông thông minh không bao giờ lấy đàn bà đẹp.'
	$array[19]='Tình yêu làm cho thời gian qua mau và thời gian cũng làm cho tình yêu qua mau. (Tư tưởng Ý)'
	$array[20]='Bạn bè tốt thanh toán tiền của họ một cách nhanh chóng. (Tục ngữ Trung Quốc)'
	$array[21]='Thà chấm dứt một cách kinh khủng còn hơn kinh khủng không bao giờ chấm dứt.'
	$array[22]='Khi đã biết tha thứ, bạn sẽ mỉm cười nhiều hơn, biết cảm nhận sâu sắc và dễ dàng thông cảm với người khác.'
	$array[23]='Yêu và được yêu là một bản nhạc nghe mãi không chán.'
	$array[24]='Trong tình yêu, kẻ hành khất và bậc vương giả đều như nhau. (Danh ngôn Ấn Độ)'
	$array[25]='Hãy suy nghĩ trước khi nói. Hãy cân nhắc trước khi làm. (W. Shakespeare)'
	$array[26]='Ở thế gian này không hề có người nào lại không cải thiện điều chi trong tâm hồn mình ngay khi đã yêu thương người khác. (Maetterlinck)'
	$array[27]='Tiếc nuối người mình yêu là điều hay, so với việc phải chung sống với người mình không yêu. (La Bruyere)'
	$array[28]='Hạnh phúc chỉ dành riêng cho những kẻ nào làm cho nhiều người được sung sướng. (Abbé Delille)'
	$array[29]='Chân lý, như ánh sáng làm mờ cả mắt. Sự dối trá, trái lại như bóng hoàng hôn làm nổi bật lên mọi mặt. (Albert Camus)'
	$array[30]='Có hai loại người: những người có thể sung sướng được mà không sung sướng, và những kẻ tìm hạnh phúc mãi mà không thấy. (Danh ngôn Ả Rập)'
	$array[31]='Đàn bà rất cay nghiệt với đàn bà. (Tennyson)'
	$array[32]='Đời người như một cành hoa mà Ái tình là một giọt mật.(Victor Hugo)'
	$array[33]='Kẻ nắm được thiên hạ là kẻ có tài giết được con thú dữ và có đức khiến mọi người đều có lòng tin là họ sẽ được chia thịt. (Khương Tử Nha)'
	$array[34]='Một tháng ngồi than thở sao bằng một giờ hoạt động. (Franklin)'
	$array[35]='Có tài chưa đủ. Cần phải biết dùng tài. (Alphose Allais)'
	$array[36]='Người ta sẵn lòng tha thứ tất cả đối với người đàn bà mình thật lòng yêu mến. Và chính vì thế mà tình yêu trở nên khó thở. (J.Chardonnes)'
	$array[37]='Thời gian không dùng để yêu thương là phung phí. (Tasse)'
	$array[38]='Không có gì nguy hại cho nhân loại hơn sự nguy hại chạy theo vật chất mà quên lãng tinh thần. (Nghiêm Phúc)'
	$array[39]='Nếu bạn được yêu, hãy yêu đi và tỏ ra đáng yêu. (English Proverbfranklin)'
	$array[40]='Rung động, yêu thương, đau khổ, hy sinh, tất cả sẽ mãi mãi là những trang tình sử của người đàn bà. (Hpnore De Balzac)'
	$array[41]='Biết đủ trong cái đủ của mình thì luôn luôn đủ.'
	$array[42]='Kẻ nào chỉ hy vọng vào vận may sẽ dễ bị thất vọng. Làm việc là cội rễ của sự thành công. (Paul Vilard)'
	$array[43]='Thiên đàng ở chính trong lòng ta. Địa ngục cũng do lòng ta mà có. (Jesus Christ)'
	$array[44]='Nền không chắc mà tường cao, thì sự sụp đổ nằm sẵn nơi đó rồi. (Hậu Hán Thơ)'
	$array[45]='Người ta dùng lửa để thử vàng. Dùng vàng để thử đàn bà. Dùng đàn bà để thử đàn ông. (Honoré de Balzac)'
	$array[46]='Một người đàn ông có thể bị lừa vào trong đam mê, nhưng phải đủ lý lẽ mới dẫn họ đến cửa thực sự. (J. Dryden)'
	$array[47]='Hoàn hảo nhất chính là không hoàn hảo nhất.'
	$array[48]='Hôn nhân không phải là xổ số. Xổ số có những người trúng số. (George Bernard Shaw)'
	$array[49]='Thành kiến là con dẻ của sự dốt nát. (Hazalitt)'
	$array[50]='Anh chỉ mang đến cho em toàn là đau khổ... Có lẽ vậy mà em yêu anh. Bởi vì niềm vui thì dễ quên, còn nỗi đau khổ thì không bao giờ. (Lermantov)'
	$array[51]='Thông thường ta tin tưởng những lý lẽ tự mình tìm ra nhiều hơn là những lý lẽ đến từ trí óc người khác. (Blase Pascal)'
	$array[52]='Khi người ta dần đi tới đích của trí tò mò thì chỉ cần một gợi mở rất nhỏ thôi thì khát khao sẽ trào dâng.'
	$array[53]='Đời người là một hài kịch, đối với những người hay suy nghĩ, và là một bi kịch với những người hay đa cảm.'
	$array[54]='Tình yêu chỉ là cuốn tiểu thuyết của trái tim, chính thú vui mới là lịch sử của nó. (Beaumaurchais)'
	$array[55]='Tình yêu mà ta cho đi là tình yêu duy nhất mà ta giữ được'
	$array[56]='Tình yêu là điều kiện, nơi đó hình ảnh của người khác cần thiết cho chính bản thân của bạn, (R.A.Heinlein)'
	$array[57]='Những sự yếu hèn của người đàn ông đã làm nên sức mạnh cho người đàn bà. (Voltaire)'
	$array[58]='Nếu bạn phải hỏi tình bạn giá bao nhiêu thì bạn không đủ tiền mua đâu. (Christopher)'
	$array[59]='Vũ trụ có nhiều kỳ quan, nhưng kỳ quan tuyệt phẩm nhất là trái tim người mẹ. (B.Shaw)'
	$array[60]='Nếu bạn muốn giàu có, chẳng những học cách làm ra tiền, mà còn phải biết cách dùng tiền. (Franklin)'
	$array[61]='Bất kì người nào gặp tôi cũng có cái đáng cho tôi học hỏi. (Pascal)'
	$array[62]='Tình yêu là sự tô điểm vĩ đại. Tình yêu làm cho thiên nhiên nở hoa, nó hát lên những bài hát kỳ diệu nhất và quay cuồng trong những vũ khúc huy hoàng. (A.Lunas)'
	$array[63]='Sự học trang hoàng đời sống và làm cho ta yêu đời hơn. (I.Viennot)'
	$array[64]='Sống không mục đích khác nào con thuyền lênh đênnh ngoài biển khơi mà không có la bàn. (J.Ruskin)'
	$array[65]='Tình yêu chân thật không phân biệt tuổi tác, địa vị, danh vọng,... Nó sang bằng tất cả. Nó là vị thần của tình cảm. (Lope De Vegas)'
	$array[66]='Hy vọng là thức ăn của người nghèo. (Tablet)'
	$array[67]='Người đàn bà mà thật thà là lúc họ thấy không cần thiết phải dùng đến sự dối trá vô ích. (Anatole France)'
	$array[68]='Sự bẽn lẽn giúp cho ái tình sức tưởng tượng, chính nó cho ái tình sinh khí. (Stendhal)'
	$array[69]='Đem xương trừ kiến, kiến lại càng nhiều. Lấy cá đuổi ruồi, ruồi lại càng đến. (Hàn Phi Tử)'
	$array[70]='Đời người được đo bằng tư tưởng và hành động chứ khong phải thời gian. (Châm ngôn Anh)'
	$array[71]='Nếu đó là một công việc quan trọng - hãy tự mình làm lấy'
	$array[72]='Gà trống có thể gáy tốt, song đẻ trứng thì vẫn phải là gà mái.'
	$array[73]='Mười lần thì có chín lần thành công nhờ sự tin và sự tận tâm làm việc. (Teewilson)'
	$array[74]='Lời nói ngọt ngào, bên trong tất phải có đắng cay.'
	$array[75]='Muốn chuẩn bị tốt cho tương lai, cách tốt nhất là đem trí tuệ và nhiệt tình để làm hoàn hảo những công việc hiện tại.'
	$array[76]='Người ta còn sống mà làm gì, khi mà sau gót giày, gió quét sạch ngay dấu tích cuối cùng của ta. (S.Xvaygo)'
	$array[77]='Sự quen biết là một người ta quen vừa đủ để mượn tiền nhưng chưa đủ để ta cho mượn. (Ambrose Bierce)'
	$array[78]='Hãy đối xử với những người bạn như với bức tranh của chính mình. Hãy đặt họ dưới ánh áng.'
	$array[79]='You can not remeber everything, but there is something you can forget!'
	$array[80]='Một ngon lửa nhỏ không đủ xóa tan màn đêm, nhưng nó lại có thể rọi sáng một con đường, dẫn chúng ta đi!'
	$array[81]='Đừng bao giờ cho mình là giỏi nhất nếu không muốn chịu thất bại cay đắng nhất!'
	$array[82]='Cảm rồi yêu, đau khổ rồi lạ hy sinh. Đó là những đề tài chính trong cuộc đời của người đàn bà.'
	$array[83]='Ganh ghét là tự thú nhận sự thua kém của chính mình. (V.Hugo)'
	$array[84]='Sắc đẹp của phụ nữ là thứ thuật luyện dan ghê gớm nó biến đàn ông thành những con lừa. (Abraham Miller)'
	$array[85]='Cách tốt nhất trong tình yêu là khi yêu không đòi hỏi. (Saint Augustin)'
	$array[86]='Điều khôn ngoan nhất là phải luôn ghi nhớ rằng: "Không có thành công hay thất bại nào là cuối cùng".'
	$array[87]='Óc của ta có thể thành ra đầy cỏ hay đầy lúa, cho nên, mỗi mùa phải nhổ cái kia đi mà tười bón cái này. (Bacon)'
	$array[88]='Chỉ có thời gian, chứ không phải lý luận, là có thể chữa được những vết thương lòng do ái tình gây ra. (P.Syrus)'
	$array[89]='Sự ly biệt của những kẻ yêu nhau nồng thắm là cái thú đau thương tuyệt vời. (Robert Burns)'
	$array[90]='Thắng được sự nóng giận, đó là chiến thắng được một kẻ thù lớn nhất. (P. Syrus)'
	$array[91]='Học mà không suy nghĩ thì vô ích; suy nghĩ mà không học là hiểm nguy. (Khổng Tử)'
	$array[92]='Có khởi đầu sẽ có bước kế tiếp.'
	$array[93]='Ái tình thật là một chuyện xưa cũ và quá tầm thường, nhưng chính nó cũng là một vấn đề quan trọng nhất của con người.(T. Wey)'
	$array[94]='Sự giận dỗi trong tình yêu cũng như muối, không nên quá nhiều.'
	$array[95]='Hạnh phúc cũng giống như một chiếc đồng hồ, loại nào đơn giản nhất là thứ ít hư nhất. (Chamfort)'
	$array[96]='Không có thứ nghệ thuật nào hơn được lòng yêu quý con người. (Van Gogh)'
	$array[97]='Cái gì xuất phát từ trái tim sẽ đi đến trái tim. (Piêt)'
	$array[98]='Người ta nếm được hạnh phúc của sự ái tình trong những sự đau đau khổ của chính nó gây nên hơn là những sung sướng do chính nó mang đến. (Dulos)'
	$array[99]='Hãy cho đi cái mà bạn có. Đối với ai đó thì món quà ấy mang một ý nghĩa sâu sắc mà bạn không ngờ. (Henry Wadsworth Longellow)'
	$array[100]='Tranh đấu để chống lại trái tim của một người phụ nữ khó khăn không thua gì uống hết một biển nước. (Richard De Fournival)'
	$array[101]='Tình yêu là cái dại của người khôn, cía khôn của người dại. (Samuel Johnson)'
	$array[102]='Kẻ nói tốt cho phụ nữ là kẻ chưa biết rõ phụ nữ, còn kẻ nói xấu phụ nữ là kẻ không biết gì cả về phụ nữ. (Pigault Lebrun)'
	$array[103]='Con người phải học yêu và trải qua đoạn đường đầy đau khổ để đạt được nó và cuộc hành trình luôn luôn hướng về linh hồn của người khác. (DH. Lawrence)'
	$array[104]='Chỉ có thượng đế mới biết người đàn bà suy nghĩ thế nào trong lòng họ.( Foucault)'
	$array[105]='Trong tình yêu chúng ta khẳng định nhau, chúng không phải thống trị nhau. Yêu đương không phải là thắng hay bại mà là nâng đỡ nhau. (Stendhal)'
	$array[106]='Tình yêu buộc phải tin vào những điều đáng lẽ phải nghi ngờ nhất. (Grandhi)'
	$array[107]='Đừng bao giờ khuyên răn ai giữa đám đông. (Tục ngữ A rập)'
	$array[108]="Love means not having to say you're sorry!"
	$array[109]='Đọc sách mà mắt không tinh tế là vùi dập cái khổ tâm của người đời trước. (Luận ngữ)'
	$array[110]='Nghèo hay giàu, có đôi lúc bạn hay độc thân, người đàn bà có ảnh hưởng đến đời sống riêng tư. Hạnh phúc của các gia đình phần lớn đều nhờ họ. (J E Pecault)'
	$array[111]='Nghe lời chê bai mà giận là ngồi cho người dèm pha. Nghe câu khen ngợi mà mừng làm mồi cho người nịnh hót. (Vân Trung Tử)'
	$array[112]="Tình yêu là tính toán, tính toán là tử thần"
	$array[113]='Thước đo giá trị của người phụ nữ chính là người đàn ông mà cô ta yêu. (Bennekin)'
	$array[114]='Tình yêu đẹp nhất cũng cần có nước mắt'
	$array[115]='Nước trong quá không có cá, người xét nét quá không có bạn. (Đông Phương)'
	$array[116]='Ái tình cũng giống như rượu mùi, càng ít tỏa bay càng nồng. (Tục ngữ Pháp)'
	$array[117]='Một đầu óc khôi hài dí dỏm sẽ làm cho mọi khó khăn trở nên dễ chịu. (Henry Ward Beecher)'
	$array[118]='Hãy suy nghĩ tất cả những gì bạn nói nhưng đừng nói tất cả những gì bạn nghĩ. (Delarme)'
	$array[119]='Đàn bà đẹp làm vui mắt, đàn bà hiền làm vui lòng. Người trước là một thứ nữ trang, còn người sau là một kho tàng. (Napoleon)'
	$array[120]='Hãy mở rộng các tính cách của chúng ta, mở rộng những cánh cửa lòng để ánh nắng thiện chí và tử tế ùa vào. (O.S Marden)'
	$array[121]='Hạnh phúc chỉ dành cho những kẻ nào làm cho nhiều người được sung sướng. (Abbe Delille)'
	$array[122]='Yêu là mục đích yêu được yêu là con người nhưng yêu vì mục đích yêu là thiên thần. (Lamartine)'
	$array[123]='Lấy tình yêu thương xóa bỏ hận thù. (Thích Ca)'
	$array[124]='Nếu bạn không tìm sự yên bình ngay trong chính bản thân bạn thì tìm nó ở bất cứ nơi nào cũng vô ích.'
	$array[125]='Cái sung sướng nhất trên đời là tin chắc chắn rằng mình đã được yêu. (Victo Huygo)'
	$array[126]='Dở nhất trong cái đạo xử thế là không thấy cái lỗi của mình.'
	$array[127]='Người đàn ông yêu thương người mà họ không kính trọng: ngược lại, người đàn bà chỉ yêu người mà họ kính trọng. (S Dubay)'
	$array[128]='Người ta chẳng chịu làm điều dở về sau mới có thể làm điều hay.'
	$array[129]='Một người đàn ông nói: "Tôi không bao giờ biết hạnh phúc là gì cho đến khi nào tôi lấy vợ... và sau đó mọi chuyện đã trở nên quá trễ!"'
	$array[130]='Tự ái là thuốc đọc giết chết tình bạn. (Balzac)'
	$array[131]='Là người tình đầu tiên của một người phụ nữ thì không có nghĩa gì cả, phải là người yêu sau cùng của họ kia. (Donnay)'
	$array[132]='Khi yêu tất cả mọi người đều như nhau: các vị thánh hay thần cũng vậy'
	$array[133]='Yêu đương vô độ thì danh dự và đạo đức chẳng còn. Nhưng nếu Thần ái tình cứ tìm đến một cách điều độ thì không có mãnh lực nào đáng yêu đến thế. (Euripides)'
	$array[134]='Yêu ai là yêu cả con người trong thực tế, chứ không phải trong ước mơ của ta. (L. Tôn-xtôi)'
	$array[135]='Hãy để cuộc đời bạn nhảy múa nhẹ nhàng trên bãi cỏ thời gian như giọt sương đêm trên ngọn lá. (Tagore)'
	$array[136]='Thường được nghe những câu chuyện ngang tai, thường gặp phải những việc phật ý cũng là một chuyện mài giũa cho con người ta được hay. (Hồng Tự Thành)'
	$array[137]='Một cuộc đời đẹp đẽ sẽ chỉ do một tư tưởng đẹp đã tâm niệm từ tuổi đầu xanh và thực hiện khi đứng tuổi'
	
If  WinExists('Lịch!') Or WinExists('Lịch tường!') Then
	MsgBox(16,'Xin lỗi-Lịch VN calendar','Bạn đang chạy chương trình rồi!'&@CRLF&'Không thể chạy được 2 chương trình cùng một lúc')
ElseIf IniRead('data.ini','kieu_lich','lich','loc')='loc' Then
	main()
Else
	lich_tuong()
EndIf
Func main()
	Local $thang_lunar, $kt
	
	;Tạo GUI (Giao diện chương trình với kích thước 350x550) nằm ở góc trên giữa màn hình
	
	
	$gui=GUICreate('Lịch!',350,550,-1,$toa_do,0,5)
	winSetOnTop("Lịch!", "", 1)
	GUISetStyle($WS_POPUPWINDOW,BitOR($WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW));Tạo style cho GUI kiểu không border và không thanh status
	GUISetBkColor(0x000000)
	WinSetTrans('Lịch!','',200)
	Guisetfont(10,12,1,'Arial')
	;Tạo nút 
	$close=GUICtrlCreateButton('r',320,1,30,25)
	GUICtrlSetFont(-1,12,12,0,'Webdings')
	GUICtrlSetCursor(-1,0)
	GUICtrlSetTip(-1,'Đóng chương trình lại')
	
	$an=GUICtrlCreateButton('5',320,30,30,25)
	GUICtrlSetFont(-1,12,12,1,'Webdings')
	GUICtrlSetTip(-1,'Ẩn chương trình lên trên')
	GUICtrlSetCursor(-1,0)
	$about=GUICtrlCreateButton('s',320,59,30,25)
	GUICtrlSetFont(-1,12,2,1,'Webdings')
	GUICtrlSetCursor(-1,4)
	GUICtrlSetTip(-1,'Thông tin về chương trình')
	
	$tien=GUICtrlCreateButton('8',250,490,50,25)
	GUICtrlSetFont(-1,12,12,1,'Webdings')
	GUICtrlSetCursor(-1,0)
	GUICtrlSetTip(-1,'Tiến lên')
	$hien_tai=GUICtrlCreateButton('Y',200,490,40,25)
	GUICtrlSetFont(-1,12,12,1,'Webdings')
	GUICtrlSetCursor(-1,0)
	GUICtrlSetTip(-1,'Trở về ngày hiện tại')
	$lui=GUICtrlCreateButton('7',140,490,50,25)
	GUICtrlSetFont(-1,12,12,1,'Webdings')
	GUICtrlSetCursor(-1,0)
	GUICtrlSetTip(-1,'Lùi lại')
	$tuy_chon=GUICtrlCreateButton('Tùy chọn',50,490,70,25)
	GUICtrlSetCursor(-1,0)
	;Tên lịCh
	$ten_lich=GUICtrlCreateLabel('VN Calendar',10,10,300,50)
	GUICtrlSetColor(-1,0xffffff)
	
	$tieu_de=GUICtrlCreateLabel('Z>I',10,30,300,100,$ss_center, $GUI_WS_EX_PARENTDRAG)
	Guictrlsettip(-1,"Di chuyen lich")
	GUICtrlSetColor(-1,0xffffff)
	GUICtrlSetFont(-1,75,12,1)
	;Tạo ngày
	$ngay_c=GUICtrlCreateLabel($hien_ngay,120,190,110,90)
	GUICtrlSetCursor(-1,4)
	GUICtrlSetTip(-1,'Kích vào đây để đổi ngày âm dương cho nhau!')
	GUICtrlSetColor($ngay_c,0xff0000)
	GUICtrlSetBkColor($ngay_c,$GUI_BKCOLOR_TRANSPARENT)
	GUICtrlSetFont($ngay_c,70,34,16)
	;Tạo năm
	$nam_c=GUICtrlCreateLabel(nam($hien_nam),140,150,120,50)
	GUICtrlSetFont(-1,15,12,1,'Times New Roman')
	GUICtrlSetBkColor($nam_c,$GUI_BKCOLOR_TRANSPARENT)
	GUICtrlSetColor($nam_c,0xff0000)
	;Tạo tháng
	$thang_ct=GUICtrlCreateLabel(thang($hien_thang),10,150,100,40)
	GUICtrlSetFont(-1,13,12)
	GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
	GUICtrlSetColor(-1,0x00FF00)
	GUICtrlSetCursor(-1,4)
	;Tháng phải
	$thang_cp=GUICtrlCreateLabel(Thang($hien_thang),260,150,100,40)
	GUICtrlSetFont(-1,13,12)
	GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
	GUICtrlSetColor(-1,0x00FF00)
	GUICtrlSetCursor(-1,4)
	;Tạo label tết
	$tet=GUICtrlCreateLabel('',0,170,350,25,$ss_center)
	GUICtrlSetFont(-1,13,12)
	GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
	GUICtrlSetColor(-1,0xff00ff0)
	;Tạo thu
	;Thứ bên trái số 1
	$thu1=GUICtrlCreateLabel(thu($hien_thu),15,250,100,30)
	GUICtrlSetFont(-1,16,12)
	GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
	
	;Thứ bên phải
	$thu2=GUICtrlCreateLabel(thu($hien_thu),260,250,100,30)
	GUICtrlSetFont(-1,16,12)
	GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
	
	;Tạo giờ
	$gio=GUICtrlCreateLabel(gio(@HOUR,@MIN,@SEC),100,370,170,35,$ss_center)
	gUICtrlSetFont(-1,29,12)
	GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
	GUICtrlSetColor(-1,0xffffff)
	GUICtrlSetCursor(-1,0)
	GUICtrlSetTip(-1,'Kích vào đây để thu nhỏ chương trình, chỉ hiện giờ')
	;Tạo danh ngôn
	$i=random(0,137,1)
	$danh_ngon=GUICtrlCreateLabel($array[$i],27,290,300,70,$SS_Center)
	GUICtrlSetFont(-1,12,12,2,'Times New Roman')
	GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
	GUICtrlSetColor(-1,0xff00ff)
	GUICtrlSetTip(-1,'Kích vào đây để đổi câu danh ngôn')
	GUICtrlSetCursor(-1,3)
	
	;Hôm nay
	$gio1=GUICtrlCreateLabel('',125,10,100,25,$ss_center,$GUI_WS_EX_PARENTDRAG)
	
	GUICtrlSetData(-1,$hom_nay)
	GUICtrlSetFont(-1,15,12)
	GUICtrlSetColor(-1,0xABCDEF0)
	;Tính can chi
	convertSolar2Lunar($hien_ngay,$hien_thang,$hien_nam,7.0)
	
	$can_chi=GUICtrlCreateLabel(cc_nam($lunaryear),0,120,350,25, $ss_center)
	GUICtrlSetFont(-1,17,12)
	GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
	GUICtrlSetColor(-1,0x00BFFF)
	
	$can_chi_ngay=GUICtrlCreateLabel('Ngày '&cc_ngay($hien_ngay,$hien_thang,$hien_nam),175,449,175,25,$ss_center)
	GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
	GUICtrlSetColor(-1,0xffffff)
	GUICtrlSetFont(-1,11)
	
	
	$can_chi_thang=GUICtrlCreateLabel('('&cc_thang($lunarmonth,$lunaryear)&')',0,449,175,25, $ss_center)
	GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
	GUICtrlSetColor(-1,0xffffff)
	GUICtrlSetFont(-1,11)
	;Tính ngày xuân phân, hạ chí , đông chí, thu phân
	$xhtd=GUICtrlCreateLabel('',260,120,150,25)
	GUICtrlSetFont(-1,16,12)
	GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
	GUICtrlSetColor(-1,0xEfA000)
	GUICtrlSetData($xhtd,xuan_thu_ha_dong_phan_chi($hien_ngay,$hien_thang))
	;Lấy ngày âM
	If $lunarday<10 Then 
		$lunarday='Mùng '&$lunarday
	Else
		$lunarday='Ngày '&$lunarday
	EndIf
	$ngay_am=GUICtrlCreateLabel($lunarday,175,414,175,50, $ss_center)
	GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
	GUICtrlSetColor(-1,0x00fffff)
	GUICtrlSetFont(-1,12,12)
	GUICtrlSetCursor(-1,4)
	If $lunarmonth=1 Then
		$thang_lunar='Tháng Giêng'
	ElseIf $lunarmonth=12 Then
		$thang_lunar='Tháng Chạp'
	Else
		$thang_lunar=thang($lunarmonth)
	EndIf
	$thang_am=GUICtrlCreateLabel($thang_lunar,0,413,175,50, $ss_center)
	GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
	GUICtrlSetColor(-1,0x00fffff)
	GUICtrlSetFont(-1,12,12)
	GUICtrlSetCursor(-1,4)
	;Kiểm tra thứ
	bay_cn()
	tet_duong()
	
	
	GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
	;Kiểm tra năm nhuận
	$nhuan=GUICtrlCreateLabel('',140,400,100,25)
	GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
	GUICtrlSetColor(-1,0x00fffff)
	GUICtrlSetFont(-1,11,12)
	$nam=StringRight(guictrlread($nam_c),stringlen(guictrlread($nam_c))-4)
	If Mod($nam,400)=0 Or ((Mod($nam,4)=0) And Mod($nam,100)<>0) Then GUICtrlSetData($nhuan,'Năm nhuận','')
	$kt=1
	;Kiểm tra ngày
	kiem_tra_ngay()
	GUISetState(@SW_SHOW)

	If $toa_do=1024 Then 
		WinMove('Lịch!','', @DesktopWidth/2-175,1000,350,550,1)	
	ElseIf $toa_do=-550 Then
		WinMove('Lịch!','', @DesktopWidth/2-175,-500,350,550,1)
	EndIf
	WinMove('Lịch!','', @DesktopWidth/2-175,0,350,550,3)	

	Do
		$msg=GUIGetMsg()
		If $msg=$lich_tuong And BitAND(GUICtrlRead($lich_tuong),$GUI_CHECKED)=$GUI_CHECKED And WinExists('Lịch!') Then
			WinMove('Lịch!','',@DesktopWidth/2-175,-550,350,550,2)
			GUIDelete()
			lich_tuong()
			WinMove('Lịch tường!','',@DesktopWidth/2-225,0,450,350,2)
		EndIf
		;Nếu nút tiến được chọn
		If $msg=$tuy_chon Then tuy_chon()
		If $msg=$hien_tai Then hien_tai()
		If _IsPressed('10',DllOpen("user32.dll")) And $msg=$tien Then
			tien_nam()
		ElseIf _IsPressed("11", DllOpen("user32.dll")) And $msg=$tien Then
			tien_thang()
		ElseIf $msg=$tien Then 
			tien_ngay()
		EndIf
		;Nếu nút lùi được chọn
		If _IsPressed('10',DllOpen("user32.dll")) And $msg=$lui Then
			lui_nam()
		ElseIf _IsPressed("11", DllOpen("user32.dll")) And $msg=$lui Then
			lui_thang()
		ElseIf $msg=$lui Then 
			lui_ngay()
		EndIf
		;Tạo giờ chạy
		If GUICtrlRead($gio)<>@HOUR&':'&@MIN&':'&@SEC  Then
			GUICtrlSetData($gio,gio(@HOUR,@MIN,@SEC))
		EndIf
		;Nếu label Danh_ngôn được chọn
		If $msg=$danh_ngon Then 
			$i=Random(0,137,1)	
			GUICtrlSetData($danh_ngon,$array[$i])
		EndIf
		If $msg=$about Then thong_tin(); Nếu nút ? được chọn
		If $msg=$an Then; Nếu nút Ẩn được chọn
			button()
			
		EndIf
		If $msg=$gio Then _gio()
		If $msg=$close Then; Nếu nút đóng được chọn
			$pos=Wingetpos($gui)
			WinMove('Lịch!','',$pos[0],1024,350,550,3)
			Exit
		EndIf
		If $msg=$tien Or $msg=$lui Or $msg=$hien_tai Then
			$day100=GUICtrlRead($ngay_c)
			$mon100=thang_nguoc(GUICtrlRead($thang_ct))
			$year100=StringRight(guictrlread($nam_c),stringlen(guictrlread($nam_c))-4)
			$nam=$year100
			If Mod($nam,400)=0 Or ((Mod($nam,4)=0) And Mod($nam,100)<>0) Then 
				GUICtrlSetData($nhuan,'Năm nhuận','')
			Else
				GUICtrlSetData($nhuan,'')
			EndIf
			;Kiểm tra can chi
			
			convertSolar2Lunar($day100,$mon100,$year100,7.0)
			If GUICtrlRead($can_chi)<>cc_nam($lunaryear) Then GUICtrlSetData($can_chi,cc_nam($lunaryear))
			GUICtrlSetData($can_chi_ngay,'Ngày '&cc_ngay($day100,$mon100,$year100))
			
			If GUICtrlRead($can_chi_thang)<>'('&cc_thang($lunarmonth,$lunaryear)&')' Then GUICtrlSetData($can_chi_thang,'('&cc_thang($lunarmonth,$lunaryear)&')')
			;Kiểm tra xuân thu phân hạ đông chí
			GUICtrlSetData($xhtd,xuan_thu_ha_dong_phan_chi($day100,$mon100))
			;Kiểm tra lịch âm
			If $lunarday<10 Then 
				$lunarday='Mùng '&$lunarday
			Else
				$lunarday='Ngày '&$lunarday
			EndIf
			If $year100>= 1900 Then 
				GUICtrlSetData($ngay_am,$lunarday)
			Else
				GUICtrlSetData($ngay_am,StringRight($lunarday,stringlen($lunarday)-2))
			EndIf
			If $lunarmonth=1 Then
				$thang_lunar='Tháng Giêng'
			ElseIf $lunarmonth=12 Then
				$thang_lunar='Tháng Chạp'
			Else
				$thang_lunar=thang($lunarmonth)
			EndIf
			GUICtrlSetData($thang_am,$thang_lunar)
			;Tạo mới danh ngôN
			$i=Random(0,137,1)	
			GUICtrlSetData($danh_ngon,$array[$i])
			;Tạo thứ trong tuần mới
			GUICtrlSetData($thu1,thu(tinh_thu($day100,$mon100,$year100)))
			GUICtrlSetData($thu2,guictrlread($thu1))
			;Kiểm tra thứ
			bay_cn()
			tet_duong()
			$hien_ngay=GUICtrlRead($ngay_c)
			$hien_thu=thu_nguoc(GUICtrlRead($thu1))
			$hien_thang=thang_nguoc(GUICtrlRead($thang_ct))
			$hien_nam=StringRight(guictrlread($nam_c),stringlen(guictrlread($nam_c))-4)
			If $hien_ngay=@MDAY And $hien_thu=@WDAY And $hien_thang=@MON And $hien_nam=@YEAR  Then
				$hom_nay='Hôm nay'
			ElseIf $hom_nay<>'Not today' Then
				$hom_nay='Not today'
			EndIf
			GUICtrlSetData($gio1,$hom_nay)
			;Kiểm tra ngày
			kiem_tra_ngay()
		EndIf
		;Nếu label ngay_c được chọn
		if $msg=$ngay_c Or $msg=$thang_ct Or $msg=$thang_cp Or $msg=$ngay_am Or $msg=$thang_am Then tinh_am()
	Until $msg=$GUI_EVENT_CLOSE 
EndFunc
;Hàm lấy thứ
Func thu($thu_ht)
	
	If $thu_ht=1 Then Return ('Chủ Nhật')
	If $thu_ht=2 Then Return ('Thứ Hai')
	If $thu_ht=3 Then Return ('Thứ Ba')
	If $thu_ht=4 Then Return ('Thứ Tư')
	If $thu_ht=5 Then Return ('Thứ Năm')
	If $thu_ht=6 Then Return ('Thứ Sáu')
	If $thu_ht=7 Then Return ('Thứ Bảy')
	EndFunc
	;Hàm thứ ngược
	Func thu_nguoc($thu_ht)
	
	If $thu_ht='Chủ Nhật' Then Return (1)
	If $thu_ht='Thứ Hai' Then Return (2)
	If $thu_ht='Thứ Ba' Then Return (3)
	If $thu_ht='Thứ Tư' Then Return (4)
	If $thu_ht='Thứ Năm' Then Return (5)
	If $thu_ht='Thứ Sáu' Then Return (6)
	If $thu_ht='Thứ Bảy' Then Return (7)
	EndFunc
	;Hàm tính thứ
	Func tinh_thu($day, $mon, $year)
		$du=jdfromdate($day,$mon,$year)
		If Mod($du,7)<>6 Then	Return Mod($du,7)+2
		If Mod($du,7)=6 Then Return 1
	EndFunc
;Hàm tháng 	
Func thang($thang_ht)
	If $thang_ht=1 Then Return ('Tháng Một')
	If $thang_ht=2 Then Return ('Tháng Hai')
	If $thang_ht=3 Then Return ('Tháng Ba')
	If $thang_ht=4 Then Return ('Tháng Bốn')
	If $thang_ht=5 Then Return ('Tháng Năm')
	If $thang_ht=6 Then Return ('Tháng Sáu')
	If $thang_ht=7 Then Return ('Tháng Bảy')
	If $thang_ht=8 Then Return ('Tháng Tám')
	If $thang_ht=9 Then Return ('Tháng Chín')
	If $thang_ht=10 Then Return ('Tháng Mười')
	If $thang_ht=11 Then Return ('Tháng Mười Một')
	If $thang_ht=12 Then Return ('Tháng Mười Hai')
	EndFunc
	;Hàm tháng ngược
		Func thang_nguoc($thang_th)
	If $thang_th='Tháng Một' Then Return ('01')
	If $thang_th='Tháng Hai' Then Return ('02')
	If $thang_th='Tháng Ba' Then Return ('03')
	If $thang_th='Tháng Bốn' Then Return ('04')
	If $thang_th='Tháng Năm' Then Return ('05')
	If $thang_th='Tháng Sáu' Then Return ('06')
	If $thang_th='Tháng Bảy' Then Return ('07')
	If $thang_th='Tháng Tám' Then Return ('08')
	If $thang_th='Tháng Chín' Then Return ('09')
	If $thang_th='Tháng Mười' Then Return ('10')
	If $thang_th='Tháng Mười Một' Then Return ('11')
	If $thang_th='Tháng Mười Hai' Then Return ('12')
	EndFunc
;Hàm lấy năm	
Func nam($nam_ht)
	Return ('Năm '&$nam_ht)
EndFunc
;Hàm thông tin về chương trình
Func thong_tin()
	Local $msg2, $close, $label, $rgn2, $gui_about, $pos, $a
	$pos = WinGetPos($gui_about)
	Local $rgn1, $width = $pos[2],$height = $pos[3]
	If WinExists('Lịch!') Then
		$gui_about=GUICreate('?',350,550,-1,-550,-1,0,$gui)
	Else
		$gui_about=GUICreate('?',350,550,-1,-550,-1,0,$gui2)
	EndIf
	GUISetStyle($WS_POPUPWINDOW,BitOR($WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))
	GUISetBkColor(0x696969)
;Tạo nút đóng
	$close=GUICtrlCreateButton('Đóng',150,500,50,30,$BS_DEFPUSHBUTTON)
	GUICtrlSetCursor(-1,0)
	;Tạo label để thông tin và di chuyển
	$a='Các chức năng chính:'&@CRLF&@CRLF&'Ấn Tiến để tiến lên 1 ngày!'&@crlf&@CRLF&'Ấn Lùi để lùi lại 1 ngày.'&@CRLF&@CRLF&'Ấn Ctrl + Tiến/Lùi để tiến/lùi 1 tháng'&@CRLF&@CRLF&'Ấn Shift + Tiến/Lùi để tiến/lùi 1 năm'
	$a&=@CRLF&@CRLF&'Ấn vào biểu tượng ngày dương, ngày âm, tháng dương hay tháng âm để chuyển đổi giữa lịch âm sang lịch dương và ngược lại. Cái này chỉ tương đối thôi nha!'
	$a&=@CRLF&@CRLF&'Phần mềm lịch VN calendar của Nguyễn Viết Hiện. Copyright © Nguyễn Viết Hiện'
	$a&=@CRLF&@CRLF&'Email: nguyenviethien96_sh@yahoo.com.vn'&@CRLF&'Hoặc: O_k0n_c0_h0i_y3u_em@yahoo.com.vn'
	$label=GUICtrlCreateLabel($a,20,10,320,500)
	GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
	GUICtrlSetColor(-1,0xEFFFFF)
	GUICtrlSetFont(-1,12,120,1,'Courier')
	
	GUISetState()
	WinMove('?','',@desktopwidth/2-175,0,350,550,2)
	While 1
		$msg2=GUIGetMsg()
		;Tạo giờ chạy
		If GUICtrlRead($gio)<>@HOUR&':'&@MIN&':'&@SEC Then
			GUICtrlSetData($gio,gio(@HOUR,@MIN,@SEC))
		EndIf
		If $msg2=$gui_event_close Or $msg2=$close Then
			WinMove('?','',@desktopwidth/2-175,-550,350,400,4)
			ExitLoop
		EndIf
	WEnd
	GUIDelete()
EndFunc
;Tạo hàm lấy giờ
Func gio($hour,$min,$sec)
	Return ($HOUR&':'&$MIN&':'&$SEC)
EndFunc	

	Func tien_ngay()
		Local $nam, $ngay, $thang
		$thang=thang_nguoc(GUICtrlRead($thang_ct))
		$ngay=GUICtrlRead($ngay_c)
		$nam=StringRight(guictrlread($nam_c),stringlen(guictrlread($nam_c))-4)
		If $ngay<28 Then
			$ngay+=1
		Else
			If $thang=4 Or $thang=6 Or $thang=9 Or $thang=11 Then
				If $ngay<30 Then
					$ngay+=1
				Else
					$ngay=1
					$thang+=1
				EndIf
			ElseIf $thang=2 Then
				If Mod($nam,400)=0 Or (Mod($nam,4)=0 And Mod($nam,100)<>0) Then
					If $ngay<29 Then
						$ngay+=1
					Else
						$ngay=1
						$thang=3
					EndIf
				Else
					If $ngay<28 Then
						$ngay+=1
					Else
						$ngay=1
						$thang=3
					EndIf
				EndIf
			ElseIf $thang=12 And $ngay=31 Then
				$nam+=1
				$thang=1
				$ngay=1
			Else
				If $ngay<31 Then
					$ngay+=1
				Else
					$ngay=1
					$thang+=1
				EndIf
			EndIf
		EndIf
		If $ngay<10 Then $ngay='0'&$ngay
		GUICtrlSetData($ngay_c,$ngay)
		If GUICtrlRead($thang_ct)<>thang($thang) Then 
			GUICtrlSetData($thang_ct,thang($thang))
			GUICtrlSetData($thang_cp,thang($thang))
		EndIf
		If GUICtrlRead($nam_c)<>'Năm '&$nam Then GUICtrlSetData($nam_c,'Năm '&$nam)
	EndFunc		
Func tien_thang()
	Local $thang, $ngay, $nam
	$nam=StringRight(guictrlread($nam_c),stringlen(guictrlread($nam_c))-4)
	$ngay=GUICtrlRead($ngay_c)
	$thang=thang_nguoc(GUICtrlRead($thang_ct))
	If $thang<12 Then
		$thang+=1
	Else
		$thang=1
		GUICtrlSetData($nam_c,'Năm '&$nam+1)
	EndIf
	GUICtrlSetData($thang_ct,thang($thang))
	GUICtrlSetData($thang_cp,thang($thang))
	If $ngay>28 Then
		If (Mod($nam,400)=0 or((Mod($nam,4)=0)And(Mod($nam,100)<>0))) And ($thang=2) Then 
			GUICtrlSetData($ngay_c,29)
		ElseIf $thang=2 Then 
			GUICtrlSetData($ngay_c,28)
		EndIf
		If ($thang=4 or $thang=6 Or $thang=9 Or $thang=11) And $ngay=31 Then GUICtrlSetData($ngay_c,30)
	EndIf
EndFunc
Func hien_tai()
	GUICtrlSetData($ngay_c,@mday)
	GUICtrlSetData($thang_ct,thang(@mon))
	GUICtrlSetData($thang_cp,thang(@mon))
	GUICtrlSetData($nam_c,'Năm '&@year)
	GUICtrlSetData($thu1,thu(@wday))
	GUICtrlSetData($thu2,thu(@wday))
	$hom_nay='Hôm nay'
EndFunc
Func tien_nam()
	Local $nam, $thang, $ngay
	$nam=StringRight(guictrlread($nam_c),stringlen(guictrlread($nam_c))-4)
	$thang=thang_nguoc(GUICtrlRead($thang_ct))
	$ngay=GUICtrlRead($ngay_c)
	GUICtrlSetData($nam_c,'Năm '&$nam+1)
	If (Mod($nam,400)=0 Or ((Mod($nam,4)=0)And(Mod($nam,100)<>0))) And $thang=2  And $ngay=29 Then 
		GUICtrlSetData($thang_ct,thang($thang+1))
		GUICtrlSetData($thang_cp,thang($thang+1))
	EndIf
EndFunc


Func lui_nam()
	Local $nam, $thang, $ngay
	$nam=StringRight(guictrlread($nam_c),stringlen(guictrlread($nam_c))-4)
	$thang=thang_nguoc(GUICtrlRead($thang_cT))
	$ngay=GUICtrlRead($ngay_c)
	GUICtrlSetData($nam_c,'Năm '&$nam-1)
	If (Mod($nam,400)=0 Or ((Mod($nam,4)=0)And(Mod($nam,100)<>0))) And $thang=2 And $ngay=29 Then
			GUICtrlSetData($ngay_c,'01')
			GUICtrlSetData($thang_ct,'Tháng Ba')
			GUICtrlSetData($thang_cp,'Tháng Ba')
	EndIf
EndFunc

Func lui_ngay()
		Local $nam, $ngay, $thang
		$thang=thang_nguoc(GUICtrlRead($thang_ct))
		$ngay=GUICtrlRead($ngay_c)
		$nam=StringRight(guictrlread($nam_c),stringlen(guictrlread($nam_c))-4)
		If $ngay>1 Then
			$ngay-=1
		ElseIf $thang=1 Then
			$thang=12
			$nam-=1
			$ngay=31
		Else
			$thang-=1
			If $thang=4 Or $thang=6 Or $thang=9 Or $thang=11 Then 
				$ngay=30
			ElseIf $thang=2 Then
				If Mod($nam,400)=0 Or (Mod($nam,4)=0 And(Mod($nam,100)<>0)) Then 
					$ngay=29
				Else
					$ngay=28
				EndIf
			Else
				$ngay=31
			EndIf
		EndIf
		If $ngay<10 Then $ngay='0'&$ngay
		GUICtrlSetData($ngay_c,$ngay)
		If GUICtrlRead($thang_ct)<>thang($thang) Then
			GUICtrlSetData($thang_ct,thang($thang))
			GUICtrlSetData($thang_cp,thang($thang))
		EndIf
		If GUICtrlRead($nam_c)<>'Năm '&$nam Then GUICtrlSetData($nam_c,'Năm '&$nam)
	EndFunc	
	
Func lui_thang()
	Local $thang, $ngay, $nam
	$nam=StringRight(guictrlread($nam_c),stringlen(guictrlread($nam_c))-4)
	$ngay=GUICtrlRead($ngay_c)
	$thang=thang_nguoc(GUICtrlRead($thang_ct))
	If $thang>1 Then
		$thang-=1
	Else
		$thang=12
		GUICtrlSetData($nam_c,'Năm '&$nam-1)
	EndIf
	GUICtrlSetData($thang_ct,thang($thang))
	GUICtrlSetData($thang_cp,thang($thang))
	If $ngay>28 Then
		If (Mod($nam,400)=0 or((Mod($nam,4)=0)And(Mod($nam,100)<>0))) And ($thang=2) Then 
			GUICtrlSetData($ngay_c,29)
		ElseIf $thang=2 Then 
			GUICtrlSetData($ngay_c,28)
		EndIf
		If ($thang=4 or $thang=6 Or $thang=9 Or $thang=11) And $ngay=31 Then GUICtrlSetData($ngay_c,30)
	EndIf
		
EndFunc

		
		
	;Tính ra số ngày Julius
func jdFromDate($dd, $mm, $yy)

Local $a, $y, $m, $jd;
$a = INT((14 - $mm) / 12);
$y = $yy+4800-$a;
$m = $mm+12*$a-3;
$jd = $dd + INT((153*$m+2)/5) + 365*$y + INT($y/4) - INT($y/100) + INT($y/400) - 32045;
if ($jd < 2299161) Then
$jd = $dd + INT((153*$m+2)/5) + 365*$y + INT($y/4) - 32083;
EndIf
return $jd;
EndFunc

;Đổi số ngày Julius ra dương lịch
func jdToDate($jd)

Local $a, $b, $c, $d, $e, $m

if ($jd > 2299160) Then;{ // After 5/10/1582, Gregorian calendar
$a = $jd + 32044;
$b = INT((4*$a+3)/146097);
$c = $a - INT(($b*146097)/4);
else 
$b = 0;
$c = $jd + 32082;
EndIf
$d = INT((4*$c+3)/1461);
$e = $c - INT((1461*$d)/4);
$m = INT((5*$e+2)/153);
$day200 = $e - INT((153*$m+2)/5) + 1;
$month200 = $m + 3 - 12*INT($m/10);
$year200 = $b*100 + $d - 4800 + INT($m/10);
return ($day200&'/'& $month200&'/'& $year200);
EndFunc
;Tính ngày Sóc thứ k kể từ điểm Sóc ngày 1/1/1900
func getNewMoonDay($k, $timeZone)
Const $pi=3.14159265358979
Local $T, $T2, $T3, $dr, $Jd1, $M, $Mpr, $F, $C1, $deltat, $JdNew;
$T = $k/1236.85; // Time in Julian centuries from 1900 January 0.5
$T2 = $T * $T;
$T3 = $T2 * $T;
$dr = $PI/180;
$Jd1 = 2415020.75933 + 29.53058868*$k + 0.0001178*$T2 - 0.000000155*$T3;
$Jd1 = $Jd1 + 0.00033*sin((166.56 + 132.87*$T - 0.009173*$T2)*$dr); // Mean new moon
$M = 359.2242 + 29.10535608*$k - 0.0000333*$T2 - 0.00000347*$T3; // Sun's mean anomaly
$Mpr = 306.0253 + 385.81691806*$k + 0.0107306*$T2 + 0.00001236*$T3; // Moon's mean anomaly
$F = 21.2964 + 390.67050646*$k - 0.0016528*$T2 - 0.00000239*$T3; // Moon's argument of latitude
$C1=(0.1734 - 0.000393*$T)*sin($M*$dr) + 0.0021*sin(2*$dr*$M);
$C1 = $C1 - 0.4068*sin($Mpr*$dr) + 0.0161*sin($dr*2*$Mpr);
$C1 = $C1 - 0.0004*sin($dr*3*$Mpr);
$C1 = $C1 + 0.0104*sin($dr*2*$F) - 0.0051*sin($dr*($M+$Mpr));
$C1 = $C1 - 0.0074*sin($dr*($M-$Mpr)) + 0.0004*sin($dr*(2*$F+$M));
$C1 = $C1 - 0.0004*sin($dr*(2*$F-$M)) - 0.0006*sin($dr*(2*$F+$Mpr));
$C1 = $C1 + 0.0010*sin($dr*(2*$F-$Mpr)) + 0.0005*sin($dr*(2*$Mpr+$M));
if ($T < -11) Then
$deltat= 0.001 + 0.000839*$T + 0.0002261*$T2 - 0.00000845*$T3 - 0.000000081*$T*$T3;
else 
$deltat= -0.000278 + 0.000265*$T + 0.000262*$T2;
EndIf
$JdNew = $Jd1 + $C1 - $deltat;
return INT($JdNew + 0.5 + $timeZone/24)
EndFunc


;Tính vị trí mặt trời tại một điểm
func getSunLongitude($jdn, $timeZone)
Const $pi=3.14159265358979
Local $T, $T2, $dr, $M, $L0, $DL, $L;
$T = ($jdn - 2451545.5 - $timeZone/24) / 36525; // Time in Julian centuries from 2000-01-01 12:00:00 GMT
$T2 = $T*$T;
$dr = $PI/180; // degree to radian
$M = 357.52910 + 35999.05030*$T - 0.0001559*$T2 - 0.00000048*$T*$T2; // mean anomaly, degree
$L0 = 280.46645 + 36000.76983*$T + 0.0003032*$T2; // mean longitude, degree
$DL = (1.914600 - 0.004817*$T - 0.000014*$T2)*sin($dr*$M);
$DL = $DL + (0.019993 - 0.000101*$T)*sin($dr*2*$M) + 0.000290*sin($dr*3*$M);
$L = $L0 + $DL; // true longitude, degree
$L = $L*$dr;
$L = $L - $PI*2*(INT($L/($PI*2))); // Normalize to (0, 2*PI)
return INT($L / $PI * 6)
EndFunc
;Hàm 
func getLunarMonth11($yy, $timeZone)

Local $k, $off, $nm, $sunLong;
$off = jdFromDate(31, 12, $yy) - 2415021;
$k = INT($off / 29.530588853);
$nm = getNewMoonDay($k, $timeZone);
$sunLong = getSunLongitude($nm, $timeZone); // sun longitude at local midnight
if ($sunLong >= 9) Then
$nm = getNewMoonDay($k-1, $timeZone);
EndIf
return $nm;
EndFunc
;Hàm xác định tháng nhuận
func getLeapMonthOffset($a11, $timeZone)
Global $thang_nhuan
Local $k, $last, $arc, $i;
$k = INT(($a11 - 2415021.076998695) / 29.530588853 + 0.5);
$last = 0;
$i = 1; // We start with the month following lunar month 11
$arc = getSunLongitude(getNewMoonDay($k+$i, $timeZone), $timeZone);
 while ($arc <> $last And $i < 14);
$last = $arc;
$i+=1;
$arc = getSunLongitude(getNewMoonDay($k+$i, $timeZone), $timeZone);
WEnd
$thang_nhuan=$i-1
return $i-1;
EndFunc
;Tìm ngày dương sang âm
func convertSolar2Lunar($dd, $mm, $yy, $timeZone)

Global $k, $dayNumber, $monthStart, $a11, $b11, $lunarDay, $lunarMonth, $lunarYear, $lunarLeap;
Local $diff, $leapmonthdiff
$dayNumber = jdFromDate($dd, $mm, $yy);
$k = INT(($dayNumber - 2415021.076998695) / 29.530588853);
$monthStart = getNewMoonDay($k+1, $timeZone);
if ($monthStart > $dayNumber) Then
$monthStart = getNewMoonDay($k, $timeZone);
EndIf
$a11 = getLunarMonth11($yy, $timeZone);
$b11 = $a11;
if ($a11 >= $monthStart) Then
$lunarYear = $yy;
$a11 = getLunarMonth11($yy-1, $timeZone);
else
$lunarYear = $yy+1;
$b11 = getLunarMonth11($yy+1, $timeZone);
EndIf
$lunarDay = $dayNumber-$monthStart+1;
$diff = INT(($monthStart - $a11)/29);
$lunarLeap = 0;
$lunarMonth = $diff+11;
if ($b11 - $a11 > 365) Then
$leapMonthDiff = getLeapMonthOffset($a11, $timeZone);
if ($diff >= $leapMonthDiff) Then
$lunarMonth = $diff + 10;
if ($diff == $leapMonthDiff) Then
$lunarLeap = 1;
EndIf
EndIf
EndIf
if ($lunarMonth > 12) Then
$lunarMonth = $lunarMonth - 12;
EndIf
if ($lunarMonth >= 11 And $diff < 4) Then
$lunarYear -= 1;
EndIf
If $lunarday<10 Then $lunarday='0'&$lunarday
EndFunc
;Tìm ngày âm sang dương
func convertLunar2Solar($lunarDay, $lunarMonth, $lunarYear, $lunarLeap, $timeZone)

Global $k, $a11, $b11, $off, $leapOff, $leapMonth, $monthStart;
if ($lunarMonth < 11) Then
$a11 = getLunarMonth11($lunarYear-1, $timeZone);
$b11 = getLunarMonth11($lunarYear, $timeZone);
else
$a11 = getLunarMonth11($lunarYear, $timeZone);
$b11 = getLunarMonth11($lunarYear+1, $timeZone);
EndIf
$off = $lunarMonth - 11;
if ($off < 0) Then
$off += 12;
EndIf
if ($b11 - $a11 > 365) Then
$leapOff = getLeapMonthOffset($a11, $timeZone);
$leapMonth = $leapOff - 2;
if ($leapMonth < 0) Then
$leapMonth += 12;
EndIf
if ($lunarLeap <> 0 And $lunarMonth <> $leapMonth) Then
return (0& 0& 0);
elseif ($lunarLeap <> 0 Or $off >= $leapOff) Then
$off += 1;
EndIf
EndIf
$k = INT(0.5 + ($a11 - 2415021.076998695) / 29.530588853);
$monthStart = getNewMoonDay($k+$off, $timeZone);
return jdToDate($monthStart+$lunarDay-1);
EndFunc
Func tinH_am()
	Local $msg1, $ngay, $thang, $nam100,$i,$a, $day, $mon, $ya,$but, $ket_qua, $but2, $kt, $kq, $dong, $labeln, $labelt, $labely
	
	$gui1=GUICreate('Chuyển đổi lịch âm <==>dương',300,300,-1,-300,-1,-1,$GUI)
	GUISetStyle($WS_POPUPWINDOW,BitOR($WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW));Tạo style cho GUI kiểu không border và không thanh status
	GUISetBkColor(0xFA8072)
	$ngay=GUICtrlCreateCombo('',20,50,50,25)
	GUICtrlSetData(-1,'01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31',GUICtrlRead($ngay_c))
	$thang=GUICtrlCreateCombo('',120,50,50,25)
	GUICtrlSetData(-1,'01|02|03|04|05|06|07|08|09|10|11|12',thang_nguoc(GUICtrlRead($thang_cp)))
	
	For $i=2500 To 1900 Step -1
		$a&=$i&'|'
	Next
	$nam100=GUICtrlCreateCombo('',220,50,60,25)
	GUICtrlSetData(-1,$a,@YEAR)
	$but=GUICtrlCreateButton('Tính dương=>âm',10,90,100,30,$BS_DEFPUSHBUTTON )
	GUICtrlSetCursor(-1,0)
	$ket_qua=GUICtrlCreateLabel('Bạn phải nhập chính xác để kết quả được tính đúng, sai không chịu trách nhiệm!',0,140,300,200, $ss_center)
	GUICtrlSetColor(-1,0x0000CD)
	GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
	GUICtrlSetFont(-1,11,34,16)
	$but2=GUICtrlCreateButton('Tính âm=>dương',125,90,100,30,$BS_RIGHTBUTTON)
	GUICtrlSetCursor(-1,0)
	
	$dong=GUICtrlCreateButton('Đóng',240,90,50,30)
	
	GUICtrlSetCursor(-1,0)
	;Tạo label
	$labeln=GUICtrlCreateLabel('Ngày',20,25,50,20)
	GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
	$labelt=GUICtrlCreateLabel('Tháng',120,25,50,20)
	GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
	$labely=GUICtrlCreateLabel('Năm',220,25,50,20)
	GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
	GUISetState()
	WinMove('Chuyển đổi lịch âm <==>dương','',@DesktopWidth/2-150,0,300,300,2)
	While 1
		$msg1=GUIGetMsg()
		;Tạo giờ chạy
		If $msg1=$but Then
			$kt=False
			$day=GUICtrlRead($ngay)
			$mon=GUICtrlRead($thang)
			$ya=GUICtrlRead($nam100)
			If StringIsDigit($mon) And StringIsDigit($day) And StringIsDigit($ya) Then
				If $mon>0 And $mon<13 Then
					If $ya<1900 or $ya>50000 Then 
						GUICtrlSetData($ket_qua,'Chương trình chỉ tính chính xác các ngày từ sau 01/01/1900 đến dưới năm 50000 thôi!')
					Else
						If $mon=4 Or $mon=6 Or $mon=9 Or $mon=11 And $day>30 Then 
							GUICtrlSetData($ket_qua,'Sorry! Bạn nhập sai!'&@CRLF&'Tháng '&$mon&' chỉ có tối đa là 30 ngày thôi!')
						ElseIf $mon=2 Then
							If (Mod($ya,400)=0 Or ((Mod($ya,4)=0)And(Mod($ya,100)<>0))) And $day>29 Then 
								GUICtrlSetData($ket_qua,'Sorry! Bạn nhập sai!'&@CRLF&'Tháng '&$mon&' năm nhuận chỉ có tối đa là 29 ngày thôi!')
							ElseIf Not (Mod($ya,400)=0 Or ((Mod($ya,4)=0)And(Mod($ya,100)<>0))) And $day>28 Then
								GUICtrlSetData($ket_qua,'Sorry! Bạn nhập sai!'&@CRLF&'Tháng 2 năm thường chỉ có 28 ngày là tối đa!')
							Else
								$kt=True
							EndIf
						Else
							If $day>31 Then
								GUICtrlSetData($ket_qua,'Sorry! Bạn nhập sai!'&@CRLF&'Tháng'&$mon&' chỉ có 31 ngày là tối đa!')
							Else
								$kt=true
							EndIf
						EndIf
					EndIf
				Else
					GUICtrlSetData($ket_qua,'Bạn nhập sai!')
				EndIf
				If $kt=true Then
					convertSolar2Lunar($day,$mon,$ya,7.0)
					GUICtrlSetData($ket_qua,'Ngày '&$day&'/'&$mon&'/'&$ya&' trong lịch dương là '&@crlf&'Ngày '&$lunarday&' /'&$lunarmonth&' /'&$lunaryear&' trong lịch âm'&@CRLF&'Năm '&cc_nam($lunaryear)&@CRLF&'Tháng '&cc_thang($lunarmonth,$lunaryear)&@CRLF&'Ngày '&cc_ngay($day,$mon,$ya)&@crlf&'Ngày '&thu(tinh_thu($day,$mon,$ya)))
				EndIf
			Else
				GUICtrlSetData($ket_qua,'Bạn nhập sai!')
			EndIf
		EndIf
		If $msg1=$but2 Then
			$day=GUICtrlRead($ngay)
			$mon=GUICtrlRead($thang)
			$ya=GUICtrlRead($nam100)
			$kq='Ngày '&convertLunar2Solar($day,$mon,$ya,0,7)&' trong lịch dương'&@CRLF&'Năm '&cc_nam($ya)&@CRLF&'Tháng '&cc_thang($mon,$ya)&@CRLF&'Ngày '&cc_ngay($day200,$month200,$year200)&@CRLF&'Ngày '&thu(tinh_thu($day200,$month200,$year200))
			convertSolar2Lunar($day200,$month200,$year200,7.0)
			$kq='Ngày '&$lunarday&'/'&$lunarmonth&'/'&$lunaryear&' trong lịch âm là '&@CRLF&$kq
			
			If StringIsDigit($mon) And StringIsDigit($day) And StringIsDigit($ya) Then
				If $ya<1900 or $ya>50000 Then 
					GUICtrlSetData($ket_qua,'Chương trình chỉ tính chính xác các ngày từ sau 01/01/1900 đến dưới năm 50000 thôi!')
				Else
					If $mon>0 And $mon<13 Then
						GUICtrlSetData($ket_qua,$kq)
					Else
						GUICtrlSetData($ket_qua,'Bạn nhập sai!')
					EndIf
				EndIf
			Else
				GUICtrlSetData($ket_qua,'Bạn nhập sai!')
			EndIf
		EndIf
		
		If GUICtrlRead($gio)<>@HOUR&':'&@MIN&':'&@SEC Then
			GUICtrlSetData($gio,gio(@HOUR,@MIN,@SEC))
		EndIf
		
		;Main()
		If $msg1=$hien_tai Then hien_tai()
		If _IsPressed('10',DllOpen("user32.dll")) And $msg1=$tien Then
			tien_nam()
		ElseIf _IsPressed("11", DllOpen("user32.dll")) And $msg1=$tien Then
			tien_thang()
		ElseIf $msg1=$tien Then 
			tien_ngay()
		EndIf
		;Nếu nút lùi được chọn
		If _IsPressed('10',DllOpen("user32.dll")) And $msg1=$lui Then
			lui_nam()
		ElseIf _IsPressed("11", DllOpen("user32.dll")) And $msg1=$lui Then
			lui_thang()
		ElseIf $msg1=$lui Then 
			lui_ngay()
		EndIf
		;Tạo giờ chạy
		If GUICtrlRead($gio)<>@HOUR&':'&@MIN&':'&@SEC  Then
			GUICtrlSetData($gio,gio(@HOUR,@MIN,@SEC))
		EndIf
		;Nếu label Danh_ngôn được chọn
		If $msg1=$danh_ngon Then 
			$i=Random(0,137,1)	
			GUICtrlSetData($danh_ngon,$array[$i])
		EndIf
		If $msg1=$about Then MsgBox(16,'Thông báo','Bạn đang chạy một tác vụ, hãy tắt nó trước khi làm việc khác',-1,$gui); Nếu nút ? được chọn
		If $msg1=$an Then; Nếu nút Ẩn được chọn
			MsgBox(16,'Thông báo','Bạn đang chạy một tác vụ, hãy tắt nó trước khi làm việc khác',-1,$gui)
		EndIf
		
		If $msg1=$close Then MsgBox(16,'Thông báo','Bạn đang chạy một tác vụ, hãy tắt nó trước khi làm việc khác',-1,$gui)
		If $msg1=$tien Or $msg1=$lui Or $msg1=$hien_tai Then
			$day100=GUICtrlRead($ngay_c)
			$mon100=thang_nguoc(GUICtrlRead($thang_ct))
			$year100=StringRight(guictrlread($nam_c),stringlen(guictrlread($nam_c))-4)
			$nam=$year100
			If Mod($nam,400)=0 Or ((Mod($nam,4)=0) And Mod($nam,100)<>0) Then 
				GUICtrlSetData($nhuan,'Năm nhuận','')
			Else
				GUICtrlSetData($nhuan,'')
			EndIf
			;Kiểm tra can chi
			
			convertSolar2Lunar($day100,$mon100,$year100,7.0)
			GUICtrlSetData($can_chi,cc_nam($lunaryear))
			GUICtrlSetData($can_chi_ngay,'Ngày '&cc_ngay($day100,$mon100,$year100))
			
			GUICtrlSetData($can_chi_thang,'('&cc_thang($lunarmonth,$lunaryear)&')')
			;Kiểm tra xuân thu phân hạ đông chí
			GUICtrlSetData($xhtd,xuan_thu_ha_dong_phan_chi($day100,$mon100))
			;Kiểm tra lịch âm
			If $year100>= 1900 Then 
				GUICtrlSetData($ngay_am,'Ngày '&$lunarday)
			Else
				GUICtrlSetData($ngay_am,'Ngày '&StringRight($lunarday,stringlen($lunarday)-2))
			EndIf
			GUICtrlSetData($thang_am,thang($lunarmonth))
			;Tạo mới danh ngôN
			$i=Random(0,137,1)	
			GUICtrlSetData($danh_ngon,$array[$i])
			;Tạo thứ trong tuần mới
			GUICtrlSetData($thu1,thu(tinh_thu($day100,$mon100,$year100)))
			GUICtrlSetData($thu2,guictrlread($thu1))
			;Kiểm tra thứ
			bay_cn()
			tet_duong()
		EndIf
		;Nếu label ngay_c được chọn
		If $msg1=$GUI_EVENT_CLOSE Or $msg1=$dong Then
			WinMove('Chuyển đổi lịch âm <==>dương','',@DesktopWidth/2-150,-300,300,300,2)
			GUIDelete()
			ExitLoop
		EndIf
	WEnd 
	
EndFunc
;Hàm kiểm tra xuân, thu phân, hạ đông chí
Func xuan_thu_ha_dong_phan_chi($ngay,$thang)
	If thang($thang)='Tháng Mười Hai' And $ngay=21 Then
		Return ('Đông Chí')
	ElseIf thang($thang)='Tháng Ba' And $ngay=20 Then
		Return ('Xuân Phân')
	ElseIf thang($thang)='Tháng Sáu' And $ngay=21 Then
		Return ('Hạ Chí')
	ElseIf thang($thang)='Tháng Chín' And $ngay=20 Then
		Return ('Thu Phân')
	Else
		Return ('')
	EndIf
EndFunc
;Hàm tính can chi
Func cc_nam($nam)
	$dem=Mod($nam+6,10)
	$j=Mod($nam+8,12)
	Return ($can[$dem]&' '&$chi[$j])
EndFunc
Func cc_ngay($day,$mon,$year)
	$nam=jdfromdate($day,$mon,$year)
	$dem=Mod($nam+9,10)
	$j=Mod($nam+1,12)
	Return ($can[$dem]&' '&$chi[$j])
EndFunc
Func cc_thang($mon,$year)
	If $mon-11>=0 Then
		$j=$mon-11
	Else
		$j=$mon+1
	EndIf
	$dem=Mod($year*12+$mon+3,10)
	Return ($can[$dem]&' '&$chi[$j])
EndFunc
Func bay_cn()
	If thu_nguoc(GUICtrlRead($thu1))=1 Then 
		GUICtrlSetColor($thu1,0xAFEEEE)
		GUICtrlSetColor($thu2,0xAFEEEE)
		GUICtrlSetColor($ngay_c,0xFF0000)
	ElseIf thu_nguoc(GUICtrlRead($thu1))=7 Then
		GUICtrlSetColor($thu1,0xAFEEEE)
		GUICtrlSetColor($thu2,0xAFEEEE)
		GUICtrlSetColor($ngay_c,0x00BFFF)
	Else
		GUICtrlSetColor($thu1,0xffffff)
		GUICtrlSetColor($thu2,0xffffff)
		GUICtrlSetColor($ngay_c,0xFFFF33)
	EndIf
EndFunc
Func tet_duong()
	Local $am
	$am=StringRight(GUICtrlRead($ngay_am),stringlen(GUICtrlRead($ngay_am))-6)
	If GUICtrlRead($ngay_c)=1 And thang_nguoc(GUICtrlRead($thang_ct))=1 Then
		
		GUICtrlSetColor($ngay_c,0xff0000)
		GUICtrlSetData($tet,'Tết Dương Lịch')
	ElseIf ($am=1 Or $am=2 Or $am=3 Or $am=4 Or $am=5)	And GUICtrlRead($thang_am)='Tháng Giêng' Then
		GUICtrlSetColor($ngay_c,0xff0000)
		GUICtrlSetData($tet,'Tết Nguyên Đán')
	Else
		GUICtrlSetData($tet,'')
	EndIf
EndFunc
Func _gio()
	Local $label, $msg, $nam, $ngay, $thang
	$ngay=@MDAY
	$thang=@MON
	$nam=@YEAR
	convertSolar2Lunar($ngay,$thang,$nam,7.0)
	If WinExists('Lịch!') Then
		$pos=WIngetpos($gui)
		WinMove('Lịch!','',$pos[0],-550,350,550,2)
		GUICreate('!',120,30,@desktopwidth/2-50,0,-1,5,$gui)
	Else
		$pos=Wingetpos($gui2)
		$pos1=Wingetpos('Ghi chú!','')
		$pos2=Wingetpos('Giờ!','')
		
		WinMove('Ghi chú!','',$pos1[0],-350,200,350,2)
		WinMove('Giờ!','',$pos2[0],-350,120,30,2)
		WinMove($gui2,'',$pos[0],-350,450,350,3)
		GUICreate('!',120,30,@desktopwidth/2-50,0,-1,5,$gui2)
	EndIf
	GUISetStyle($WS_EX_OVERLAPPEDWINDOW,BitOR($WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))
	GUISetBkColor(0x708090)
	$label=GUICtrlCreateLabel(@hour&':'&@min&':'&@sec,0,0,120,30,$ss_center)
	GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
	GUICtrlSetFont(-1,14,12)
	GUICtrlSetColor(-1,0xffffff)
	GUICtrlSetCursor(-1,0)
	GUICtrlSetTip(-1,'  Hôm nay là ngày '&@mday&'/'&@mon&'/'&@year&@crlf&thu(@WDAY)&@TAB&@TAB&'Ngày '&cc_ngay($ngay,$thang, $nam)&@CRLF&'Năm '&cc_nam($lunaryear)&@TAB&'Tháng '&cc_thang($lunarmonth,$lunaryear))
	GUISetState()
		WinMove('!','',@desktopwidth/2-50,0,120,30,1)
	
	Do
		$msg=GUIGetMsg()
		If GUICtrlRead($label)<>@hour&':'&@min&':'&@sec Then GUICtrlSetData($label,@hour&':'&@min&':'&@sec)
	Until $msg=$GUI_EVENT_CLOSE Or $msg=$label Or $msg=$an
	GUIDelete()
	If WinExists('Lịch!') Then
		$pos=Wingetpos($gui)
		WinMove('Lịch!','',$pos[0],0,350,550,3)
	Else
		$pos=Wingetpos($gui2)
		$pos1=Wingetpos('Ghi chú!','')
		$pos2=Wingetpos('Giờ!','')
		WinMove('Lịch tường!','',$pos[0],0,450,350,3)
		WinMove('Giờ!','',$pos2[0],350,120,30,2)
		WinMove('Ghi chú!','',$pos1[0],0,200,350,2)
	EndIf
EndFunc
;Hàm tùy chọNext
Func tuy_chon()
	Local  $label, $pos, $khoi_dong, $vt, $do_trong, $data, $lich_tuong
	
	If WinExists('Lịch!') Then
		$gui3=GUICreate('Tùy chọn',350,200,-1,-300,-1,-1, $gui)
	Else
		$gui3=GUICreate('Tùy chọn',350,200,-1,-300,-1,-1, $gui2)
	EndIf
	GUISetFont(14,21,1,'Times New Roman',$gui3)
	GUISetStyle($WS_POPUPWINDOW,BitOR($WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW));Tạo style cho GUI kiểu không border và không thanh status
	GUISetBkColor(0xAFEEEE)
	$tat=GUICtrlCreateButton('Đóng lại',150,150,80,30,$BS_DEFPUSHBUTTON)
	GUICtrlSetCursor(-1,0)
	
	
	GUICtrlCreateLabel('Cách hiển thị lịch!',10,60,200,25)
	$lich_tuong=GUICtrlCreateCombo('',10,100,200,25,$CBS_DROPDOWNLIST)
	
	If WinExists('Lịch!') Then
		$data='Hiện lịch lốc!'
	Else
		$data='Hiện lịch tường!'
	EndIf
	GUICtrlSetData(-1,'Hiện lịch lốc!|Hiện lịch tường!',$data)
	GUISetState()
	$khoi_dong=GUICtrlCreateCheckbox('Khởi động cùng máy tính',10,10,250,25)
	GUICtrlSetColor($khoi_dong,0xffffff)
	GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
	;Lấy vị trí của chương trình trong máy
	$vt=FileGetLongName(@ScriptDir&'\lich.exe')
	If RegRead('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run','lich_sh')=$vt Then GUICtrlSetState(-1,$GUI_CHECKED)
	WinMove('Tùy chọn','',@DesktopWidth/2-175,0,350,200,2)
	While 1
		$msg=GUIGetMsg()
		
		
		
		If $msg=$lich_tuong  Then
			If GUICtrlRead($lich_tuong)='Hiện lịch lốc!' And WinExists('Lịch tường!') Then
				IniWrite('data.ini','kieu_lich','lich','loc')
				WinMove('Giờ!','',@DesktopWidth/2-60,-30,120,30,2)
				WinMove('Ghi chú!','',@DesktopWidth/2+225,-450,200,450,2)
				WinMove('Lịch tường!','',@DesktopWidth/2-225,-450,450,450,2)
				GUIDelete($gui2)
				$toa_do=-550
				main()
			ElseIf GUICtrlRead($lich_tuong)='Hiện lịch tường!' And (Not WinExists('Lịch tường!')) Then
				IniWrite('data.ini','kieu_lich','lich','tuong')
				WinMove('Lịch!','',@DesktopWidth/2-175,-550,350,550,2)
				GUIDelete($gui)
				$toa_do=-350
				lich_tuong()
			EndIf
		EndIf
		If $msg=$khoi_dong  Then
			
			If BitAND(GUICtrlRead($khoi_dong), $GUI_UNCHECKED) = $GUI_UNCHECKED Then
				GUICtrlSetState($khoi_dong, $GUI_unCHECKED)
				RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run','lich_sh','REG_SZ','')
	
			Else
				GUICtrlSetState($khoi_dong, $GUI_CHECKED)
				RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run','lich_sh','REG_SZ',$vt)
				
			EndIf
			
		EndIf
		;Tạo giờ chạy
		If GUICtrlRead($gio)<>@HOUR&':'&@MIN&':'&@SEC  Then
			GUICtrlSetData($gio,gio(@HOUR,@MIN,@SEC))
		EndIf
		;Nếu label Danh_ngôn được chọn
		If $msg=$danh_ngon Then 
			$i=Random(0,137,1)	
			GUICtrlSetData($danh_ngon,$array[$i])
		EndIf
		If WinExists('Lịch!') Then
			If _IsPressed('10',DllOpen("user32.dll")) And $msg=$lui Then
				lui_nam()
			ElseIf _IsPressed("11", DllOpen("user32.dll")) And $msg=$lui Then
				lui_thang()
			ElseIf $msg=$lui Then 
				lui_ngay()
			EndIf
			If ($msg=$tien Or $msg=$lui Or $msg=$hien_tai) And WinExists('Lịch!') Then
				$day100=GUICtrlRead($ngay_c)
				$mon100=thang_nguoc(GUICtrlRead($thang_ct))
				$year100=StringRight(guictrlread($nam_c),stringlen(guictrlread($nam_c))-4)
				$nam=$year100
				If Mod($nam,400)=0 Or ((Mod($nam,4)=0) And Mod($nam,100)<>0) Then 
					GUICtrlSetData($nhuan,'Năm nhuận','')
				Else
					GUICtrlSetData($nhuan,'')
				EndIf
				;Kiểm tra can chi
				
				convertSolar2Lunar($day100,$mon100,$year100,7.0)
				GUICtrlSetData($can_chi,cc_nam($lunaryear))
				GUICtrlSetData($can_chi_ngay,'Ngày '&cc_ngay($day100,$mon100,$year100))
				
				GUICtrlSetData($can_chi_thang,'('&cc_thang($lunarmonth,$lunaryear)&')')
				;Kiểm tra xuân thu phân hạ đông chí
				GUICtrlSetData($xhtd,xuan_thu_ha_dong_phan_chi($day100,$mon100))
				;Kiểm tra lịch âm
				If $year100>= 1900 Then 
					GUICtrlSetData($ngay_am,'Ngày '&$lunarday)
				Else
					GUICtrlSetData($ngay_am,'Ngày '&StringRight($lunarday,stringlen($lunarday)-2))
				EndIf
				GUICtrlSetData($thang_am,thang($lunarmonth))
				;Tạo mới danh ngôN
				$i=Random(0,137,1)	
				GUICtrlSetData($danh_ngon,$array[$i])
				;Tạo thứ trong tuần mới
				GUICtrlSetData($thu1,thu(tinh_thu($day100,$mon100,$year100)))
				GUICtrlSetData($thu2,guictrlread($thu1))
				;Kiểm tra thứ
				bay_cn()
				tet_duong()
			EndIf
		EndIf
If $msg=$gui_event_close Or $msg=$tat Then
	WinMove('Tùy chọn','',@DesktopWidth/2-175,-350,350,200,5)
	ExitLoop
EndIf
WEnd
	GUIDelete()
EndFunc
#cs
#&=================================================
#ce
;Hàm button()

Func button()
	Local $msg, $mo, $ngay, $thang, $nam
	If WinExists('Lịch!') Then
		$pos=Wingetpos($gui)
		WinMove('Lịch!','',$pos[0],-550,350,550,5)
	Else
		$pos=Wingetpos($gui2)
		$pos1=Wingetpos('Ghi chú!','')
		$pos2=Wingetpos('Giờ!','')
		WinMove('Giờ!','',$pos2[0],-30,120,30,2)
		WinMove('Ghi chú!','',$pos1[0],-350,200,350,2)
		WinMove('Lịch tường!','',$pos[0],-350,450,350,5)
	EndIf
	$toa_do=0
	If WinExists('Lịch!') Then
		GUICreate('mo',25,25,@desktopwidth/2-15,0,-1,5,$gui)
	Else
		GUICreate('mo',25,25,@desktopwidth/2-15,0,-1,5,$gui2)
	EndIf
	GUISetStyle($WS_POPUPWINDOW,BitOR($WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW));Tạo s
	GUISetBkColor(0xf5f5f5)
	$ngay=@MDAY
	$thang=@MON
	$nam=@YEAR
	convertSolar2Lunar($ngay,$thang,$nam,7.0)
	$mo=GUICtrlCreateButton('6',0,0,25,25)
	GUICtrlSetFont(-1,12,12,1,'Webdings')
	GUICtrlSetTip(-1,'  Hôm nay là ngày '&@mday&'/'&@mon&'/'&@year&@crlf&thu(@WDAY)&@TAB&'Ngày '&cc_ngay($ngay,$thang, $nam)&@CRLF&'Năm '&cc_nam($lunaryear)&@TAB&'Tháng '&cc_thang($lunarmonth,$lunaryear))
	GUICtrlSetCursor(-1,0)
	GUISetState()
	WinMove('mo','',@desktopwidth/2-15,0,30,30,1)
	Do 
		$msg=GUIGetMsg()
	Until $msg=$mo
	GUIDelete()
	If WinExists('Lịch!') Then
		$pos=Wingetpos($gui)
		WinMove('Lịch!','',$pos[0],0,350,550,5)
	Else
		$pos=Wingetpos($gui2)
		$pos1=Wingetpos('Ghi chú!','')
		$pos2=Wingetpos('Giờ!','')
		
		WinMove('Lịch tường!','',$pos[0],0,450,350,5)
		WinMove('Giờ!','',$pos2[0],350,120,30,2)
		WinMove('Ghi chú!','',$pos1[0],0,200,350,2)
	EndIf
	
EndFunc
;Kiểm tra ngày
Func kiem_tra_ngay()
	Local $ngay, $thang, $nam
	If WinExists('Lịch!') Then
		$ngay=GUICtrlRead($ngay_c)
	Else
		$ngay=StringLeft(guictrlread($ngay_c),2)
	EndIf
	$thang=thang_nguoc(GUICtrlRead($thang_ct))
	$nam=StringRight(guictrlread($nam_c),StringLen(guictrlread($nam_c))-4)
	convertSolar2Lunar($ngay,$thang,$nam,7.0)
	;Ngày sinh Bác Hồ
	If $ngay=19 And $thang=5 Then GUICtrlSetData($danh_ngon,'Kỉ niệm '&$nam-1890&' năm ngày mất của Chủ tịch Hò Chí Minh')
		;Ngày lễ tình yêu
	If $ngay=14 And $thang=2 Then GUICtrlSetData($danh_ngon,'Ngày lễ tình yêu ^_^ - Chúc mọi người một ngày tràn ngập tình yêu thương')
		;Ngày cách mạng tháng Tám
	If $ngay=19 And $thang=8 Then GUICtrlSetData($danh_ngon,'Ngày Cách Mạng tháng Tám thành công. ^_^')
		;Ngày thế giới vì Hòa binh
	If $ngay=1 And $thang=9 Then GUICtrlSetData($danh_ngon,'Ngày Thế giới vì Hòa bình.'&@crlf&'Hi vọng một ngày thế giới không còn chiến tranh và mãi mãi không')
		;Ngày Quốc khánh
	If $ngay=2 And $thang=9 Then GUICtrlSetData($danh_ngon,'Ngày Quốc khánh nước Cộng Hòa Xã Hội Chủ Nghĩa Việt Nam')
		;Ngày quốc tế các nhà báo
	If $ngay=8 And $thang=9 Then GUICtrlSetData($danh_ngon,'Ngày Quốc tế các nhà báo')
	;Ngày quốc tế phụ nữ
	If $ngay=8 And $thang=3 Then GUICtrlSetData($danh_ngon,'Ngày Quốc tế Phụ nữ')
	;Ngày thàh lập tổng công đoàn Viêt Nam
	If $ngay=28 And $thang=7 Then GUICtrlSetData($danh_ngon,'Ngày thành lập Tổng công đoàn Việt Nam')
	; Ngày thương binh liệt sỹ
	If $ngay=27 And $thang=7 Then GUICtrlSetData($danh_ngon,'Ngày thương binh liệt sĩ (1947)')
		;Ngày 30-4
	If $ngay=30 And $thang=4 Then GUICtrlSetData($danh_ngon,'Ngày giải phóng miền Nam')
		;Ngày quốc tê lao động
	If $ngay=1 And $thang=5 Then GUICtrlSetData($danh_ngon,'Ngày Quốc tế Lao động')
		;Ngày giỗ tổ Hùng Vương
	If $lunarday=10 And $lunarmonth=3 Then GUICtrlSetData($danh_ngon,'Ngày Giỗ tổ Hùng Vương'&@crlf&'Dù ai đi ngược về xuôi'&@crlf&'Nhớ ngày giỗ Tổ mùng mười tháng ba!')
	EndFunc
Func lich_tuong()
	
	Local $label, $i, $j, $gui51
	GUIDelete($gui)
	$gui2=GUICreate('Lịch tường!',450,450,@DesktopWidth/2-225,$toa_do,-1)
	Guisetfont(10,12,1,'Arial')
	GUISetStyle( $WS_DLGFRAME,BitOR($WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))
	GUISetBkColor(0xf5f5f5)
	WinSetTrans('Lịch tường!','',250)
	WinSetOnTop('Lịch tường!','',1)
	$tuy_chon=GUICtrlCreateButton('Tùy chọn',190,420,70,25)
	GUICtrlSetCursor(-1,0)
	$an=GUICtrlCreateButton('5',400,30,30,25)
	GUICtrlSetFont(-1,12,1,1,'Webdings')
	GUICtrlSetCursor(-1,0)
	$close=GUICtrlCreateButton('r',400,1,30,25)
	GUICtrlSetFont(-1,12,1,1,'Webdings')
	GUICtrlSetCursor(-1,0)
	GUICtrlSetTip(-1,'Đóng chương trình lại')
	$about=GUICtrlCreateButton('s',400,59,30,25)
	GUICtrlSetFont(-1,12,1,1,'Webdings')
	GUICtrlSetCursor(-1,4)
	GUICtrlSetTip(-1,'Thông tin về chương trình')
	$tien=GUICtrlCreateButton('8',270,420,50,25)
	GUICtrlSetFont(-1,12,1,1,'Webdings')
	GUICtrlSetCursor(-1,0)
	GUICtrlSetTip(-1,'Tiến lên')
	$hien_tai=GUICtrlCreateButton('Y',205,380,40,25)
	GUICtrlSetFont(-1,12,1,1,'Webdings')
	GUICtrlSetCursor(-1,0)
	GUICtrlSetTip(-1,'Trở về ngày hiện tại')
	$lui=GUICtrlCreateButton('7',130,420,50,25)
	GUICtrlSetFont(-1,12,1,1,'Webdings')
	GUICtrlSetCursor(-1,0)
	GUICtrlSetTip(-1,'Lùi lại')
	$nam_c=GUICtrlCreateLabel('Năm '&$hien_nam,15,1,400,30,$ss_center,$GUI_WS_EX_PARENTDRAG)
	GUICtrlSetFont(-1,14)
	$thang_ct=GUICtrlCreateLabel(thang($hien_thang),20,50,150,25,$ss_center)
	GUICtrlSetFont(-1,13)
	;Tính can chi
	convertSolar2Lunar($hien_ngay,$hien_thang,$hien_nam,7.0)
	
	$can_chi=GUICtrlCreateLabel(cc_nam($lunaryear),165,40,120,30, $ss_center)
	GUICtrlSetFont(-1,14,12)
	GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
	GUICtrlSetColor(-1,0x00BFFF)
	
	
	For $i=0 To 6 Step 1
		$ngay[0][$i]=GUICtrlCreateLabel(thu($i+1),$i*60+20,90,50,20, $ss_center)
		GUICtrlSetBkColor(-1,0xff00ff)
	Next
	For $i=0 To 6 Step 1
		For $j=1 To 6 Step 1
			$ngay[$j][$i]=GUICtrlCreateLabel('',$i*60+20,$j*40+80,50,30,$ss_center)
			GUICtrlSetBkColor(-1,0x00008B)
			GUICtrlSetColor(-1,0xff0000)
			GUICtrlSetFont(-1,13)
			
		Next
	Next
	
	tao_ngay($hien_thang,$hien_nam)
	ngay_tuong($hien_ngay,$hien_thang,$hien_nam)
	GUISetState(@SW_SHOW)
	WinMove('Lịch tường!','',@DesktopWidth/2-225,$toa_do+10,450,350,2)
	WinMove('Lịch tường!','',@DesktopWidth/2-225,0,450,350,2)
	
	$gui4=GUICreate('Giờ!',120,30,@DesktopWidth/2-60,-30,-1,0, $gui2)
	GUISetStyle($WS_POPUPWINDOW,BitOR($WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))
	GUISetBkColor(0xf5f5f5)
	WinSetTrans('Giờ!','',250)
	$gio=GUICtrlCreateLabel(@hour&':'&@min&':'&@sec,0,0,120,30,$ss_center)
	GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
	GUICtrlSetFont(-1,14,12)
	GUICtrlSetColor(-1,0x708090)
	GUICtrlSetCursor(-1,0)
	GUISetState(@SW_SHOW)
	WinMove('Giờ!','',@DesktopWidth/2-60,350,120,30,2)
	$gui5=GUICreate('Ghi chú!',200,450,@DesktopWidth/2+225,-450,BitOR($WS_POPUP, $WS_OVERLAPPED), BitOR($WS_EX_TOOLWINDOW, $WS_EX_MDICHILD, $WS_EX_CLIENTEDGE, $WS_EX_LAYERED),$gui2)
	GUISetStyle($WS_POPUPWINDOW,BitOR($WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))
	GUISetBkColor(0xf5f5f5)
	WinSetTrans('Ghi chú!','',250)
	GUICtrlCreateLabel('GHI CHÚ',50,10,120,35)
	GUICtrlSetColor(-1,0xff0000)
	GUICtrlSetFont(-1,20)
	$danh_ngon=GUICtrlCreateLabel('',10,110,180,140,$ss_center)
	GUICtrlSetData(-1,$array[random(0,137,1)])
	GUICtrlSetFont(-1,10,12)
	GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
	GUICtrlSetColor(-1,0xff00ff)
	GUICtrlSetTip(-1,'Kích vào đây để đổi câu danh ngôn')
	GUICtrlSetCursor(-1,3)
	$phong_to=GUICtrlCreateButton('>>',0,425,25,25)
	GUICtrlSetTip(-1,'Kích vào đây để mở ra')
	_GUICtrlButton_Show($phong_to, False)
	$thu_nho=GUICtrlCreateButton('<<',175,10,25,25)
	GUICtrlSetTip(-1,'Thu nhỏ lại')
	$can_chi_ngay=GUICtrlCreateLabel('Ngày '&cc_ngay($hien_ngay,$hien_thang,$hien_nam),40,380,120,25,$ss_center)
	GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
	GUICtrlSetFont(-1,11)
	
	
	$can_chi_thang=GUICtrlCreateLabel('Tháng '&cc_thang($lunarmonth,$lunaryear),40,400,120,25, $ss_center)
	GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
	GUICtrlSetFont(-1,11)
	kiem_tra_ngay()
	GUISetState(@SW_SHOW)
	WinMove('Ghi chú!','',@DesktopWidth/2+225,0,200,350,2)
	$t=true
	$t1=true
	
While 1
		$pos=GUIGetCursorInfo($gui2)
		$msg=GUIGetMsg()
		If $msg=$lui Then
			If $hien_thang>1 Then
				$hien_thang-=1
			Else
				$hien_thang=12
				$hien_nam-=1
			EndIf
			GUICtrlSetData($thang_ct,thang($hien_thang))
			If 'Năm '&$hien_nam<> GUICtrlRead($nam_c) Then 
				GUICtrlSetData($nam_c,'Năm '&$hien_nam)
				GUICtrlSetData($can_chi,cc_nam($hien_nam))
			EndIf
			tao_ngay($hien_thang,$hien_nam)
			ngay_tuong($hien_ngay,$hien_thang,$hien_nam)
		EndIf
		If $msg=$tien Then
			If $hien_thang<12 Then
				$hien_thang+=1
			Else
				$hien_thang=1
				$hien_nam+=1
			EndIf
			GUICtrlSetData($thang_ct,thang($hien_thang))
			If 'Năm '&$hien_nam<> GUICtrlRead($nam_c) Then 
				GUICtrlSetData($nam_c,'Năm '&$hien_nam)
				GUICtrlSetData($can_chi,cc_nam($hien_nam))
			EndIf
			tao_ngay($hien_thang,$hien_nam)
			ngay_tuong($hien_ngay,$hien_thang,$hien_nam)
		EndIf
		If GUICtrlRead($gio)<>@hour&':'&@min&':'&@sec Then GUICtrlSetData($gio,@hour&':'&@min&':'&@sec)
		If $msg=$gio Then _gio()
		If $msg=$thu_nho Then 
			_GUICtrlButton_Show($thu_nho, False)
			$pos1=Wingetpos($gui5)
			WinMove('Ghi chú!','',$pos1[0],$pos1[1],30,350,2)
			WinMove('Ghi chú!','',$pos1[0],$pos1[1],30,30,2000)
			_GUICtrlButton_Show($phong_to, True)
		EndIf
		If $msg=$phong_to Then 
			$pos1=wingetpos($gui5)
			_GUICtrlButton_Show($phong_to, False)
			WinMove('Ghi chú!','',$pos1[0],$pos1[1],30,350,2)
			WinMove('Ghi chú!','',$pos1[0],$pos1[1],200,350,2)
			_GUICtrlButton_Show($thu_nho, True)
		EndIf
		If $msg=$about Then thong_tin()
		
		If $msg=$an Then button()
		If $msg=$tuy_chon And Not (WinExists('Tùy chọn')) Then tuy_chon()	
		If $msg=$gui_event_close Or $msg=$close Then
			$pos=Wingetpos($gui2)
			$pos1=Wingetpos('Ghi chú!','')
			$pos2=Wingetpos('Giờ!','')
			WinMove('Giờ!','',$pos2[0],-30,120,30,2)
			WinMove('Ghi chú!','',$pos1[0],-320,200,350,2)
			WinMove('Ghi chú!','',$pos1[0],-350,200,350,2)
			Guidelete($gui4)
			Guidelete($gui5)
			WinMove('Lịch tường!','',$pos[0],1024,450,350,3)
			GUIDelete()
			Exit
		EndIf
		If $msg=$danh_ngon Then 
			GUICtrlSetData($danh_ngon,$array[random(0,137,1)])
		EndIf
	WEnd 
	Exit
EndFunc
Func tao_ngay($thang,$nam)
	
	Local $i, $j,$na, $kt
	If $thang=4 Or $thang=6 Or $thang=9 Or $thang=11 Then
		$kt=1
	ElseIf $thang=2 And (Mod($nam,400)=0 Or ((Mod($nam,4)=0 And (Mod($nam,100)<>0)))) Then
		$kt=2
	ElseIf $thang=2 Then
		$kt=3
	Else
		$kt=4
	EndIf
	$thu_nay=tinh_thu(1,$thang,$nam)-1
	GUICtrlSetData($ngay[1][$thu_nay],'01')
	$na='02'
	If $thu_nay=6 Then
		For $i=1 To 1 Step 1
			For $j=0 To 5 Step 1 
				GUICtrlSetData($ngay[$i][$j],'')
			Next
		Next
		For $i=2 To 6 Step 1
			For $j=0 To 6 Step 1
				GUICtrlSetData($ngay[$i][$j],$na)
				$na+=1
				If $na<10 Then $na='0'&$na
				If $kt=1 Then 
					If $na>31 Then GUICtrlSetData($ngay[$i][$j],'')
				ElseIf $kt=2 Then
					If $na>30 Then GUICtrlSetData($ngay[$i][$j],'')
				ElseIf $kt=3 Then
					If $na>29 Then GUICtrlSetData($ngay[$i][$j],'')
				Else
					If $na>32 Then GUICtrlSetData($ngay[$i][$j],'')
				EndIf
			Next
			Next
			For $ai=$i To 6 Step 1
				For $bi=$j To 6 Step 1
					GUICtrlSetData($ngay[$i][$j],'')
				Next
			Next
	Else
		For $i=1 To 1 Step 1
			For $j=0 To $thu_nay-1 Step 1 
				GUICtrlSetData($ngay[$i][$j],'')
			Next
		Next
		For $i=1 To 1 Step 1
			For $j=$thu_nay+1 To 6 Step 1
				GUICtrlSetData($ngay[$i][$j],$na)
				$na+=1
				If $na<10 Then $na='0'&$na
			Next
		Next
		For $i=2 To 6 Step 1
			For $j=0 To 6 Step 1
				GUICtrlSetData($ngay[$i][$j],$na)
				$na+=1
				If $na<10 Then $na='0'&$na
				If $kt=1 Then 
					If $na>31 Then GUICtrlSetData($ngay[$i][$j],'')
				ElseIf $kt=2 Then
					If $na>30 Then GUICtrlSetData($ngay[$i][$j],'')
				ElseIf $kt=3 Then
					If $na>29 Then GUICtrlSetData($ngay[$i][$j],'')
				Else
					If $na>32 Then GUICtrlSetData($ngay[$i][$j],'')
				EndIf
			Next
		Next
		
	EndIf
	EndFunc
	Func ngay_tuong($day,$month,$year)
		Local $ai, $i
		For $ai=1 To 6 Step 1
			For $i=0 To 6 Step 1
			If GUICtrlRead($ngay[$ai][$i])=$day Then
				GUICtrlSetbkColor($ngay[$ai][$i],0xfefe0e)
				
			Else
				GUICtrlSetbkColor($ngay[$ai][$i],0x00008B)
			EndIf
			Next
		Next
	EndFunc
	