# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $fakeInput = $(".fake-input").find("input")

  # OPTIMIZE: chromeでdropすると2回イベントが起きる。
  $fakeInput.on 'change drop',(e)->
    setTimeout( ->

      fakeText = $fakeInput.val()
      unless fakeText == ""

        # chromeのvalからfakepathを消す
        if fakeText.match /fakepath/
          fakeTextArray = fakeText.split("\\fakepath\\")
          fakeText = fakeTextArray[1]

        # 文字数が多い場合中抜く
        if fakeText.length > 35
          fakeBegin = fakeText.substr(0,15)
          fakeEnd = fakeText.substr(-15)
          fakeText = fakeBegin + "......"+ fakeEnd

        # iconとOK
        fakeText = "<i class='icon-ok'></i>OK : " + fakeText

        $(".fake-input").find("span").html(fakeText)
        $(".fake-input").addClass("fake-text")

      else
        $(".fake-input").find("span").html("クリックかドラッグ")
        $(".fake-input").addClass("fake-click-drag")
    ,100)