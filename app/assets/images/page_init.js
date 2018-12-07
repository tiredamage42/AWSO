

/*
in images directory so it only runs once
*/


//initialize stacked images (with filters on top)
function init_stack (stack) {
    //create image
    img_node = document.createElement("img");
    //add classes to image
    img_node.classList = stack.getAttribute('img_class');
    //add source
    img_node.src = stack.getAttribute('src');
    //add to stack
    stack.appendChild(img_node);
}
var stacks = document.getElementsByClassName('img-stack');
for (var i = 0; i < stacks.length; i++) { init_stack(stacks[i]); }

$("img").on("error", function(){$(this).attr('src', '/assets/x_img.png');})
