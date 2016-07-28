defmodule Pingo.ExAdmin.Campaign do
  use ExAdmin.Register
  import Pingo.AssetHelper, only: [upload_path: 1]

  register_resource Pingo.Campaign do
    form campaign do
      inputs do
        input campaign, :name
        input campaign, :description
        input campaign, :cover, type: :file
      end
    end

    show _ do
      attributes_table do
        row :name
        row :description
        row :cover, &(img(src: upload_path(Pingo.CampaignCover.url({&1.cover, &1})), height: 250))
      end
    end

    index _ do
      import Kernel, except: [div: 2]
      cell fn(p) ->
        div ".box" do
          div ".box-body" do
            a href: admin_resource_path(p, :show) do
              img(src: Pingo.CampaignCover.url({p.cover, p}, :thumb), height: 100)
            end
          end
          div ".box-footer" do
            a truncate(p.name), href: admin_resource_path(p, :show)
          end
        end
      end
    end
  end
end
