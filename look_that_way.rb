################################## じゃんけんの関数の定義 ####################################
def rock_scissors_paper 
    puts "(出す手を数字で選んでください)"
    puts "---------------------------------"
    puts "[0]:グー\n[1]:チョキ\n[2]:パー"

    ###################### 変数の定義 ###########################
    player_hand = gets.chomp.to_i #自分の手をplayer_handに代入
    opponent_hand = rand(0..2) #相手の手を1~3の乱数で生成
    array_hands = ["グー", "チョキ", "パー"]
    ############################################################

    ########################### じゃんけんの勝敗の分岐 ##############################
    if /^[0-2]$/ =~ player_hand.to_s #0~2の数字が入力された場合
        puts "----------------------------------"
        puts "ポン！"
        sleep 1
        puts "あなたが出した手：#{array_hands[player_hand]}" #自分が出した手を表示
        puts "相手が出した手：#{array_hands[opponent_hand]}" #相手が出した手を表示
        sleep 1
        puts "----------------------------------"

        if player_hand == opponent_hand #あいこの場合
            puts "あいこです"
            sleep 1
            puts "あいこで、、、"
            sleep 1
            return "draw"
        elsif (player_hand == 0 && opponent_hand == 1) || (player_hand == 1 && opponent_hand == 2) || (player_hand == 2 && opponent_hand == 0) #じゃんけんに勝った場合
            puts "あなたの勝ちです！"
            sleep 1
            return "win"
        else #じゃんけんに負けた場合
            puts "あなたの負けです、、、"
            sleep 1
            return "lose"
        end
    
    else #0~2以外の数字が入力された場合
        puts "0~2の数字を入力してください"
        sleep 1
        return "draw"
    end
    ################################################################################
end    
#########################################################################################


################################## あっちむいてホイの関数の定義 ####################################
def look_that_way

    ###################### 変数の定義 ###########################
    opponent_finger = rand(0..3)
    opponent_face = rand(0..3)
    array_direction = ["上", "右", "下", "左"]
    ###########################################################

    ####################### じゃんけんの勝敗による分岐 #######################
    if $next_rock_scissors_paper == "win" #じゃんけんに勝った場合
        puts "(指差す方向を数字で入力してください)"
        puts "---------------------------------"
        puts "[0]:上\n[1]:右\n[2]:下\n[3]:左"
        player_finger = gets.chomp.to_i

        if /^[0-3]$/ =~ player_finger.to_s #0~3のいずれかが入力された場合
            puts "---------------------------------"
            puts "ホイ！"
            sleep 1
            puts "あなたが指した方向：#{array_direction[player_finger]}" #自分が出した手を表示
            puts "相手が向いた方向：#{array_direction[opponent_face]}" #相手が出した手を表示
            sleep 1
            puts "---------------------------------"

            #################### あっち向いてホイの勝敗の処理 #######################
            if player_finger == opponent_face
                puts "あなたの勝利です！\nおめでとう！"
                return false
            else
                puts "勝負を続けます"
                sleep 1
                return true
            end
    
        else
            puts "0~3のいずれかの数字を入力してください"
            sleep 1
            return "redo"
        end

    else #じゃんけんに負けた場合
        puts "(顔を向ける方向を数字で入力してください)"
        puts "---------------------------------"
        puts "[0]:上\n[1]:右\n[2]:下\n[3]:左"
        player_face = gets.chomp.to_i

        if /^[0-3]$/ =~ player_face.to_s #0~3のいずれかが入力された場合
            puts "---------------------------------"
            puts "ホイ！"
            sleep 1
            puts "あなたが向いた方向：#{array_direction[player_face]}" #自分が出した手を表示
            puts "相手が指した方向：#{array_direction[opponent_finger]}" #相手が出した手を表示
            sleep 1
            puts "---------------------------------"

            #################### あっち向いてホイの勝敗の処理 #######################
            if player_face == opponent_finger
                puts "あなたの負けです、、、\nまた挑戦してね！"
                sleep 1
                return false
            else
                puts "勝負を続けます"
                sleep 1
                return true
            end
    
        else #0~3以外の数字が入力された場合
            puts "0~3のいずれかの数字を入力してください"
            sleep 1
            return "redo"
        end
        
    end
    ###############################################################################
end
#########################################################################################


################################## ターミナルへの出力 ####################################

puts "あっち向いてホイを始めましょう！"
sleep 1
puts "最初はグー、じゃんけん、、、"
sleep 1

$next_rock_scissors_paper = "draw" #1回目のじゃんけんは行わなければならないため、drawを代入

while $next_rock_scissors_paper == "draw" do
    $next_rock_scissors_paper = rock_scissors_paper #じゃんけんの度にnext_gameをdraw, win, loseのいずれかで上書きする。drawである間はじゃんけんを続ける
end


puts "あっち向いて、、、"
sleep 1

$next_look_that_way = look_that_way

while $next_look_that_way == "redo" #0~3以外の値が入力された場合
    $next_look_that_way = look_that_way # あっち向いてホイの処理を繰り返す
end


while $next_look_that_way do
    puts "最初はグー、じゃんけん、、、"
    sleep 1    
    $next_rock_scissors_paper = "draw" #1回目のじゃんけんは行わなければならないため、drawを代入

    while $next_rock_scissors_paper == "draw" do
        $next_rock_scissors_paper = rock_scissors_paper #じゃんけんの度にnext_gameをdraw, win, loseのいずれかで上書きする。drawである間はじゃんけんを続ける
    end
    
    puts "あっち向いて、、、"
    sleep 1
    

    $next_look_that_way = look_that_way    #あっち向いてホイをするたびにtrue, falseのいずれかで上書きする
    while $next_look_that_way == "redo" #0~3以外の値が入力された場合
        $next_look_that_way = look_that_way # あっち向いてホイの処理を繰り返す
    end
end
