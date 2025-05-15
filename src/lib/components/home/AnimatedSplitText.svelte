<script>
    import { onMount } from "svelte";
    import gsap from "gsap";
    import { SplitText } from "gsap/SplitText";

    $effect (() => {
      console.clear();

        const texts = gsap.utils.toArray(".text");
        const splits = texts.map((t) =>
        SplitText.create(t, {
            type: "chars",
            mask: "chars"
        })
        );
        const overlap = "-=0.5";
        const tl = gsap.timeline({
        defaults: {
            ease: "none",
            stagger: {
            amount: 0.5
            }
        },
        repeat: -1
        });

        splits.forEach((s, i) => {
        const next = splits[i + 1];
        if (next) {
            tl.to(
            s.chars,
            {
                xPercent: -100
            },
            "+=1"
            ).from(
            next.chars,
            {
                xPercent: 100
            },
            overlap
            );
        } else {
            tl.to(
            s.chars,
            {
                xPercent: -100
            },
            "+=1"
            );
        }
        });
        tl.fromTo(
        splits[0].chars,
        {
            xPercent: 100
        },
        {
            xPercent: 0,
            immediateRender: false
        },
        overlap
        );

        gsap.set(texts, { opacity: 1 });

    });
</script>

<div class="wrapper">
  <div class="container">
    <div class="text">ZEITERFASSUNG</div>
    <div class="text">PRODUKTIVITÄT</div>
    <div class="text">TIMESWIFT</div>
  </div>
</div>

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    .wrapper {
        align-items: center;
        display: flex;
        height: 60vh;
        padding: 50px;
    }

    .container {
        width: 100%;
        font-size: 150px;
        position: relative;
    }

    .text {
        position: absolute;
        top: 0;
        left: 0;
        line-height: 1;
        opacity: 0;
        color: whitesmoke;
    }

</style>